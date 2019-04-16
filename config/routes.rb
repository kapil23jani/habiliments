Rails.application.routes.draw do
  get 'welcomes/index'
  devise_for :users, controllers: { confirmations: 'users/confirmations', registrations: 'users/registrations'}
  root "welcomes#index"

  resources :welcomes

  resources :users do 
  	resources :sellerprofiles
  	resources :categories
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
