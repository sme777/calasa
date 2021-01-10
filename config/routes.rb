Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/' => 'users#index'
  get '/signin' => 'sessions#signin'
  post '/signin' => 'sessions#create'
  get '/register' => 'users#register'
  post '/register' => 'users#create'
  get '/signout' => 'sessions#signout'

  resources :events do
    member do
      patch :edit
    end
  end
  # get '/events' => 'posts#event'
  
end
