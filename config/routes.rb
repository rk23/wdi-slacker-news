Rails.application.routes.draw do

  #Users routes
  get '/signup'       => 'users#new'
  post '/users'       => 'users#create'
  get '/user/:id'     => 'users#show'

  #Sessions routes
  get '/login'        => 'sessions#new'
  post '/login'       => 'sessions#create'
  get '/logout'       => 'sessions#destroy'

  #Posts routes - display list of all posts/comments
  root                   'posts#index'
  get '/newest'       => 'posts#newest'
  get '/newcomments'  => 'posts#newcomments'

  #Posts routes - manipulate posts
  get '/post'         => 'posts#new'
  post '/post'        => 'posts#create'
  delete '/post/:id'  => 'posts#destroy'
  get '/post/:id'     => 'posts#show'

  resources :posts, except: [:destroy] do
    
    member do
      post 'vote'  #/posts/3/vote
    end
    
    collection do
      get 'archives'  #/posts/archives
    end
  
    resources :comments do
      member do
        post 'vote'  
      end
    end
  end

  #Comments routes
  post '/post/:id'    => 'comments#create'
  get  '/reply/:id'   => 'comments#show'
  post '/reply/:id'   => 'comments#reply'

end
