Rails.application.routes.draw do
  root 'static#home'
 # resources :users
  resources :fights
  resources :monsters
  get '/signup', to: "users#new", as: "signup"
  post '/signup', to: "users#create"
  get '/login', to: "sessions#new", as: "login"
  post '/login', to: "sessions#create"
  post '/logout', to: "sessions#destroy"
  get '/auth/facebook/callback', to: "sessions#createfb"
end
