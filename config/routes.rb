Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users

  resources :kitchen do
    resources :review, only: [:new, :create]
    resources :appointment, only: [:new, :create]
  end
  resources :appointment, only: [:show, :edit, :update, :destroy]

end
