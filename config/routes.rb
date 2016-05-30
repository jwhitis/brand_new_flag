Rails.application.routes.draw do
  root "home#index"
  resources :photos, only: :create
end