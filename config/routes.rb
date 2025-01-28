Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Root path
  root "home#index"

  # Devise routes for authentication
  devise_for :users

  # User resources
  resources :users, only: [:show]

  # Home controller routes
  post 'home/verify'

  # Health check endpoint
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
