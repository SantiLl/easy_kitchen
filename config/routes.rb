Rails.application.routes.draw do
  root to: 'kitchens#index'
  devise_for :users

  resources :kitchens do
    resources :reviews, only: [:new, :create]
    resources :appointments, only: [:new, :create]
  end
  resources :appointments, only: [:show, :edit, :update, :destroy]
  get '/dashboard/', to: 'pages#dashboard', as: :dashboard
end
