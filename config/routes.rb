Rails.application.routes.draw do
  
  get "signup" => "users#new"
  get "login" => "sessions#new"
  resources :users, except: [:new,:index]
  resources :sessions, except: [:index,:edit,:update,:show,:new]
  
  #put the reviews under the packages
  resources :packages do
    resources :reviews
    
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "about" => "sites#about"

  # Defines the root path route ("/")
  root "sites#index"
end
