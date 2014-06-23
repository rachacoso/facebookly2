Rails.application.routes.draw do
  get '/' => 'home#front', as: 'homepage'

  get '/signup' => 'user#new'
  post '/signup' => 'user#create'

  get '/login' => 'session#new'
  post '/login' => 'session#create'

  get '/logout' => 'session#destroy'

  get '/friend/:id' => 'friend#new'
  post '/friend' => 'friend#create'
  get '/friend/deny/:id' => 'friend#destroy'
  get '/friend/nevermind/:id' => 'friend#destroy'
  get '/friend/accept/:id' => 'friend#accept'

  get '/friend' => 'home#front'

  get '/preferences/edituser' => 'user#update'
  patch '/preferences/edituser' => 'user#do_update'

  post '/post' => 'post#create'

  get '/view/:id' => 'friend#view'


end
