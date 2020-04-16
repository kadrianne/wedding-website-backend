Rails.application.routes.draw do
  resources :admins, only: [:create]
  resources :logins, only: [:create]
  resources :guests, only: [:index, :show, :create, :update, :destroy]
  resources :addresses, only: [:index, :show, :create]
  resources :households, only: [:index, :show, :create]
  post 'admin-login', to: 'admins#login'
  post 'guest-login', to: 'logins#login'
  post 'authenticate-login', to: 'application#authenticate_login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
