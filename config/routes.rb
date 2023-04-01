Rails.application.routes.draw do
  
  resources :posts do
    resources :likes, only: [:create]
    resources :comments, only: [:create, :index]
  end
  put '/users/:id/avatar', to: 'users#update_avatar'
  resources :likes, only: [:destroy]
  get 'private/test'
  get '/users/:username', to: 'users#show'
  get '/users/:id/posts', to: 'users#posts'
  devise_for :users, 
    path: '', 
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      registration: 'signup'
    },
    controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
