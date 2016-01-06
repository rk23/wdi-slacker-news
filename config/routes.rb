Rails.application.routes.draw do

  root 'posts#index'

  #User routes
  get '/signup'       => 'users#new'
  post '/users'       => 'users#create'
  get '/user/:id'     => 'users#show'

  #Sessions routes
  get '/login'        => 'sessions#new'
  post '/login'       => 'sessions#create'
  get '/logout'       => 'sessions#destroy'

  #Post routes
  get '/post'         => 'posts#new'
  post '/post'        => 'posts#create'
  delete '/post/:id'  => 'posts#destroy'
  get '/post/:id'     => 'posts#show'
  post '/post/:id'    => 'comments#create'

  #Comments routes
  get  '/reply/:id'   => 'comments#show'
  post '/reply/:id'   => 'comments#reply'

end
