Rails.application.routes.draw do
  resources :categories
  resources :products
  resources :websites
  devise_for :users, controllers: { sessions: "users/sessions" }
	root 'home#index'
end
