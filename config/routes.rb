Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:edit, :update, :new, :post]
  root to: 'items#index'
  resources :items, only: [:edit, :new, :create, :post, :show] 

end
