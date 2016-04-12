Rails.application.routes.draw do
  resources :categories
  resources :products
  resources :websites
	resources :alerts, only: [:index, :show, :destroy, :check_alerts] 
	get '/check_alerts', to: 'alerts#check_alerts', as: 'check_alerts'
  devise_for :users, controllers: { sessions: "users/sessions" }
	root 'home#index'
end
