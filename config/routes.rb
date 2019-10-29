Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :rides

  resources :attractions

  resources :users, :sessions

  root 'static_pages#home'

  get 'signin', to: 'sessions#new'

  get '/signout', to: 'sessions#destroy'
  post "/rides/new", to: "rides#new"

