# Pin npm packages by running ./bin/importmap

Rails.application.config.importmap.draw do
  pin "@hotwired/turbo-rails", to: "turbo.min.js"
  pin "@hotwired/stimulus", to: "stimulus.min.js"
  pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
  pin "application", preload: true
  pin "bootstrap", to: "https://ga.jspm.io/npm:bootstrap@5.3.3/dist/js/bootstrap.esm.js"
  pin "@popperjs/core", to: "https://ga.jspm.io/npm:@popperjs/core@2.11.8/lib/index.js"
  pin "jquery", to: "https://code.jquery.com/jquery-3.7.1.min.js"
  pin_all_from "app/javascript/controllers", under: "controllers"
end