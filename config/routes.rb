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
  get '/show/:id'   => 'posts#show'
  post '/post'  => 'posts#create'

  #Comments routes
  get  '/reply/:id' => 'comments#show'
  post '/reply/:id' => 'comments#reply'
  post '/show/:id'  => 'comments#create'

end
