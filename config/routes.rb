Rails.application.routes.draw do
  resources :admins, only: [:create]
  resources :logins, only: [:create]
  resources :guests, only: [:index, :show, :create, :update, :destroy]
  resources :addresses, only: [:index, :create]
  resources :households, only: [:index, :create]
  post 'admin-login', to: 'admins#login'
  post 'guest-login', to: 'logins#login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
