import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["draggable", "droppable"]

  connect() {
    console.log("Drag Drop controller connected")
  }

  dragStart(event) {
    event.target.classList.add("dragging")
  }

  dragEnd(event) {
    event.target.classList.remove("dragging")
  }

  dragOver(event) {
    event.preventDefault()
    this.droppableTarget.classList.add("drag-over")
  }

  dragLeave() {
    this.droppableTarget.classList.remove("drag-over")
  }

  drop(event) {
    event.preventDefault()
    this.droppableTarget.classList.remove("drag-over")
    
    const rect = this.droppableTarget.getBoundingClientRect()
    const top = event.clientY - rect.top
    const left = event.clientX - rect.left

    const token = document.querySelector('meta[name="csrf-token"]').content
    
    fetch("/home/verify", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "Accept": "text/vnd.turbo-stream.html",
        "X-CSRF-Token": token
      },
      body: JSON.stringify({ top, left })
    })
  }

  reset() {
    window.location.reload()
  }
}