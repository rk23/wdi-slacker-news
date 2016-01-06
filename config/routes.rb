Rails.application.routes.draw do

  root 'posts#index'

  #User routes
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/users/:id' => 'users#show'

  #Sessions routes
  get '/login'  => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  #Post routes
  get '/post'   => 'posts#new'
  post '/post'  => 'posts#create'

end