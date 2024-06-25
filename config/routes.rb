Rails.application.routes.draw do
  get 'user/index'
  match '/users',   to: 'users#index',   via: 'get'
  resources :artifacts
  resources :projects
  devise_for :users
  root 'home#index'

end
