Rails.application.routes.draw do
  root 'home#index'

  devise_for :customers, :controllers => { registrations: 'registrations' }
  devise_for :admins
  
  resources :payments
  resources :products
  resources :order_lines, only: [:create, :update, :destroy]
  resource :carts, only: [:index, :show]

  post "/products/:id/add_to_cart" => "cart#add_to_cart", as: "add_to_cart"

end
