Rails.application.routes.draw do
  get 'mailing_list/addUser'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/' => 'users#index'
  get '/signin' => 'sessions#signin'
  post '/signin' => 'sessions#create'
  get '/register' => 'users#register'
  post '/register' => 'users#create'
  get '/membership' => 'memberships#index'
  get '/signout' => 'sessions#signout'
  post '/membership' => 'memberships#addUser'
  get '/membership/success' => 'memberships#success'
  get '/membership/error' => 'memberships#error'
  resources :events do
    member do
      patch :edit
    end
  end

  resources :fundraisers 
  
  get '/management' => 'roles#index'
  post '/management/create' => 'roles#create'
  patch '/management/update' => 'roles#update'
  post '/management/delete/:id' => 'roles#delete', as: :remove_exec
  # get '*path' => redirect('/404.html')
end
