Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :planes, only: [ :index, :show ]
  resources :users, only: [ :index, :show, :destroy ]
  resources :reviews, only: [ :new, :create]
  resources :bookings, only: [:new, :create, :index, :destroy, :show]
end
