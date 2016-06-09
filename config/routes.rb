Rails.application.routes.draw do
  resources :ingredients, only: [:index, :show, :new, :create]
  resources :receipts, only: [:index, :show, :new, :create]

  root 'home#index'
  get 'search', to: 'search#index'
end
