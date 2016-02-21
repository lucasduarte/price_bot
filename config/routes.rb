Rails.application.routes.draw do
  resources :categories
  resources :products
  resources :websites
	resources :alerts, only: [:index, :show] 
  devise_for :users, controllers: { sessions: "users/sessions" }
	root 'home#index'
end
