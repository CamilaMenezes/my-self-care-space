Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :services, only: [:new, :create, :show]
end
