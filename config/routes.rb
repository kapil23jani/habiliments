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
    get 'category/:category_id/category_sub_category' , to: "welcomes#category_sub_category",  as: "sub_categories"
    get 'category/:category_id/category_sub_category/:sub_category_id' , to: "welcomes#products",  as: "product"
    get 'description_products/:product_id', to: "welcomes#description_products", as: "product_description"
    resources :carts


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
