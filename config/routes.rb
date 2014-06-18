Rails.application.routes.draw do
  get '/' => 'home#front'

  get '/signup' => 'user#new'
  post '/signup' => 'user#create'

  get '/login' => 'session#new'
  post '/login' => 'session#create'

  get '/logout' => 'session#destroy'

  get '/friend/:id' => 'friend#new'
  post '/friend' => 'friend#create'
  get '/friend/deny/:id' => 'friend#destroy'
  get '/friend/nevermind/:id' => 'friend#destroy'

  get '/friend' => 'home#front'



end
