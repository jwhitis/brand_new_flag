Rails.application.routes.draw do
  root "home#index"
  resources :twitter_shares, only: :create
end