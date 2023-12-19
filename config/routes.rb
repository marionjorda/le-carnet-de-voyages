Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Users
  get "api/users" => "users#show" 
  post "api/users" => "users#create"
  #put
  #delete

  # Trips
  get "api/trips" => "trips#show" 
  post "api/trips" => "trips#create"
  
  put "api/trips" => "trips#update"
  delete "api/trips" => "trips#delete"

  get "trips/new" => "trips#new"
  
  # Defines the root path route ("/")
  root "trips#index"
end
