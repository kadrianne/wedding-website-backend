Rails.application.routes.draw do
  resources :guests, only: [:index]
  resources :addresses, only: [:index]
  resources :households, only: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
