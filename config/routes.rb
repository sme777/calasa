Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/' => 'users#index'
  get '/signin' => 'users#signin'
  get '/register' => 'users#register'
  post '/register' => 'users#create'
  get '/events' => 'posts#event'
  
end
