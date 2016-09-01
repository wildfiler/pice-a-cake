Rails.application.routes.draw do
  resources :ingredients, only: [:index, :show, :new, :create],
                          constraints: { id: /\d+/ } do
    resource :loved, only: [:create], controller: :loved_ingredients
    resource :hated, only: [:create], controller: :hated_ingredients
  end
  scope :ingredients do
    resources :loved, only: [:index], controller: :loved_ingredients
    resources :hated, only: [:index], controller: :hated_ingredients
  end

  resources :recipes, only: [:index, :show, :new, :create, :edit, :update],
                       constraints: { id: /\d+/ } do
    resource :loved, only: [:create], controller: :loved_recipes
    resource :hated, only: [:create], controller: :hated_recipes
    resource :cooked, only: [:create], controller: :cooked_recipes
  end
  scope :recipes do
    resources :loved, only: [:index], controller: :loved_recipes
    resources :hated, only: [:index], controller: :hated_recipes
    resources :cooked, only: [:index], controller: :cooked_recipes
  end

  resources :faq, only: [:index, :new, :create]

  root 'home#index'
  get 'search', to: 'search#index'
end
