Rails.application.routes.draw do
  resources :websites
  devise_for :users, controllers: { sessions: "users/sessions" }
	root 'home#index'
end
