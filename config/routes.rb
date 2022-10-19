Rails.application.routes.draw do
  root 'users#index'
  devise_for :users
  resources :users
  resources :recipes, only: %i[index show new create destroy]
end
