Rails.application.routes.draw do

  root 'posts#index'

  #User routes
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  get '/user/:id' => 'users#show'

  #Sessions routes
  get '/login'  => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  #Post routes
  get '/post'   => 'posts#new'
  post '/post'  => 'posts#create'
  get '/post/:id' => 'posts#show'
  # TODO consolidate '/show/:id' w/ '/post/:id'
    delete '/post/:id' => 'posts#destroy'
    get '/show/:id'   => 'posts#show'

  #Comments routes
  get  '/reply/:id' => 'comments#show'
  post '/reply/:id' => 'comments#reply'
  post '/show/:id'  => 'comments#create'

end
