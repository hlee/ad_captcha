# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $("#draggable").draggable()
  $("#droppable").droppable drop: (event, ui) ->
    v_drop = this
    $.ajax
      type: 'GET'
      url: "/home/verify"
      data: "top=" + ui.position.top + "&left=" + ui.position.left
      success: (data) ->
        if data == 'ok'
          $('#draggable').fadeOut('slow').hide();
          $('#droppable').fadeOut('slow').hide();
          $(v_drop).addClass("ui-state-highlight").addClass("full").fadeIn('slow').find("p").html "Passed!"  
        else
          $('#droppable').effect("highlight", {}, 400).find("p").html "Try again"  
        #alert data