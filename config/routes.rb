Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "registrations"}
  root to: 'pages#home'
  resources :profiles, only: [:show] do
    resources :images, only: [:create, :index]
  end

  resources :services do
    resources :orders, only: [:new, :create] 
  end
  

  resources :order, only: [:update] do
    post 'confirmation', to: 'orders#confirmation'
    post 'cancelation', to: 'orders#cancelation'
  end
  get 'my_profile', to: 'profiles#my_profile'
  get 'edit_professional_info', to: 'profiles#edit_professional_info'
  patch 'update_professional_info', to: 'profiles#update_professional_info'

end
