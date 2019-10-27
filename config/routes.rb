Rails.application.routes.draw do
  # get 'users/edit'
  # get 'users/new'
  # get 'users/show'
  # get 'users/signin'
  # get 'static_pages/home'
  # get 'sessions/new'
  # get 'attractions/edit'
  # get 'attractions/index'
  # get 'attractions/new'
  # get 'attractions/show'

  # roots
  root 'static_pages#home'

  resources :users, only: [:new, :create, :show]
  resources :attractions
  resources :rides, only: [:new, :create]

  # sessions
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/session', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
