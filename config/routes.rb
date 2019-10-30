Rails.application.routes.draw do
  
  root to: 'kitchens#index'
  devise_for :users

  resources :kitchens do
    resources :appointments, only: [:new, :create]
  end
  resources :appointments, only: [:show, :edit, :update, :destroy] do
    resources :reviews, only: [:create]
  end
  
  get '/dashboard/', to: 'pages#dashboard', as: :dashboard
  
end
