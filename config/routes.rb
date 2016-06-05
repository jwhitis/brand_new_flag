Rails.application.routes.draw do
  root "home#index"
  post "photos/preview", to: "photos#preview", as: :preview_photo
  resources :photos, only: [:index, :create] do
    get :download, on: :member
  end
end