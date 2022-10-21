Rails.application.routes.draw do
  root 'public_recipes#index'
  devise_for :users, controllers: { registrations: "registrations" }

  resources :recipes, only: %i[index show new create destroy] do
    resources :recipe_foods, only: [:new,:create, :destroy]
  end
  
  resources :foods, only: [:index, :new, :create, :destroy]
  
end
