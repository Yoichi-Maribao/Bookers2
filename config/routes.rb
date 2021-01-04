Rails.application.routes.draw do
  get 'home/about', to:'homes#about'
  devise_for :users
  root to: 'homes#top'
  resources :books, only: [:index, :create, :show, :destroy, :edit, :update]
  resources :users, only: [:index, :show, :edit, :update]
end