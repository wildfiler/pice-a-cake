Rails.application.routes.draw do
  resources :ingredients, only: [:index, :show, :new, :create]
  root 'home#index'
end
