Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :show, :index, :create, :update]
  resources :attractions
  resources :rides, only: [:index, :new, :create, :edit, :update]

  get '/signin', to: "sessions#new"
  post '/signin', to: "sessions#create"
  get '/logout', to: "sessions#destroy"

  root 'users#index'

end

