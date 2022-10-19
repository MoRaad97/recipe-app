Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  resources :recipes, only: %i[index show new create destroy]
  resources :foods

end
