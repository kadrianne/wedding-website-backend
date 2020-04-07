Rails.application.routes.draw do
  resources :logins
  resources :guests, only: [:index, :create]
  resources :addresses, only: [:index, :create]
  resources :households, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
