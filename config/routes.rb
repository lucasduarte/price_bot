Rails.application.routes.draw do
  resources :categories
  resources :products
  resources :websites
	resources :alerts, only: [:index, :show, :destroy] 
  devise_for :users, controllers: { sessions: "users/sessions" }
	root 'home#index'
end
