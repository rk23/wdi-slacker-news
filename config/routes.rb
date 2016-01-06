Rails.application.routes.draw do

  root 'posts#index'

  #User routes
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  #Sessions routes
  get '/login'  => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  #Post routes
  get '/post'   => 'posts#new'
  post '/post'  => 'posts#create'

  #Comments routes
  get '/show/:id'   => 'comments#show'
  post '/show/:id'  => 'comments#create'

end
