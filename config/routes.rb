Rails.application.routes.draw do
  devise_for :users do
    resources :planes
  end

  resources :users, only: [ ] do
    resources :planes, only: [ :index ]
  end
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :planes, only: [ :index, :show ]
end
