Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # resources :profile, only []
  resources :services do
    resources :orders, only: [:new, :create] 
  end

  resources :order, only: [:update]

end
