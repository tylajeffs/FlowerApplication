Rails.application.routes.draw do
  get 'reviews/index'
  resources :packages

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "about" => "sites#about"

  # Defines the root path route ("/")
  root "sites#index"
end
