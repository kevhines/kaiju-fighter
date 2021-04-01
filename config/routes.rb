Rails.application.routes.draw do

  resources :locations
  root 'static#home'

  resources :users, only: [:show]
  #resources :fights
  resources(:monsters) do
    resources :fights
  end

  #non-standard routes
  get '/standings', to: "monsters#standings", as: "standings"

  #sign up and log in routes
  get '/signup', to: "users#new", as: "signup"
  post '/signup', to: "users#create"
  get '/login', to: "sessions#new", as: "login"
  post '/login', to: "sessions#create"
  post '/logout', to: "sessions#destroy"
  get '/auth/facebook/callback', to: "sessions#createfb"

end
