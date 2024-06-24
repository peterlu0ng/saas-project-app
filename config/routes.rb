Rails.application.routes.draw do
  resources :artifacts
  resources :projects
  devise_for :users
  root 'home#index'

end
