Rails.application.routes.draw do
  resources :ingredients, only: [:index, :show, :new, :create]
  resources :receipts, only: [:index, :show]
  root 'home#index'
end
