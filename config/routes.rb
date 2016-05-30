Rails.application.routes.draw do
  resources :ingredients, only: [:index]
  root 'home#index'
end
