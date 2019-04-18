Rails.application.routes.draw do
  get 'welcomes/index'
  devise_for :users, controllers: { confirmations: 'users/confirmations', registrations: 'users/registrations'}
  root "welcomes#index"

  resources :welcomes

  resources :users do 
  	resources :sellerprofiles
  	resources :categories do 
  		resources :sub_categories do 
  			resources :products
  		end
  	end
  	resources :addresses


  	get 'list' , to: "categories#list"
  	get 'seller' , to: "welcomes#seller"
  	get 'customer' , to: "welcomes#customer"
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
