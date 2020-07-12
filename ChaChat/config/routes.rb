Rails.application.routes.draw do
  root 'rooms#index'
  resources :rooms, only: %i[show new destroy]
  devise_for :users
end
