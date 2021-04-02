Rails.application.routes.draw do

  resources :locations, except: [:create, :new, :destroy]
  root 'static#home'

  resources :fights, only: [:index]
  resources(:users, only: [:index]) do
    resources :monsters, only: [:index]
  end
  resources(:monsters, except: [:destroy]) do
    resources :fights, only: [:create, :new]
  end

  #non-standard routes
  get '/standings', to: "monsters#standings", as: "standings"
  get '/strongest', to: "monsters#strongest", as: "strongest"
  get '/wrecked', to: "locations#wrecked", as: "wrecked"
  get '/battle', to: "fights#battle", as: "battle"
  post '/battle', to: "fights#createbattle"

  #sign up and log in routes
  get '/signup', to: "users#new", as: "signup"
  post '/signup', to: "users#create"
  get '/login', to: "sessions#new", as: "login"
  post '/login', to: "sessions#create"
  post '/logout', to: "sessions#destroy"
  get '/auth/facebook/callback', to: "sessions#createfb"

end
