Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, :only => [:new, :create, :show]
  resources :sessions, :only => [:new, :create, :destroy]
  resources :attractions, :only => [:index, :new, :create, :show, :edit, :update]
  resources :rides, :only => [:create]
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  post "/logout", to: "sessions#destroy"

  root "welcome#home"

end
