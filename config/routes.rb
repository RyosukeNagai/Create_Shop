Rails.application.routes.draw do
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
  }

  namespace :admin do
    get 'top'=>'orders#top'
    resources :products,only: [:index, :new, :create, :show, :edit, :update, :destroy]
    resources :users,only: [:index, :show, :edit, :update]
    resources :orders,only: [:index]
    resources :categories,only: [:index, :new, :create, :edit, :update, :destroy]
  end
  devise_scope :user do
    get 'users/sign_up/done', to: 'users/registrations#done'
    post 'user/cart_items' => "user/cart_items#create"
    delete 'user/cart_item/:id' => "user/cart_items#destroy", as: "cart_item"
    patch 'user/cart_item/:id' => "user/cart_items#update"
    put 'user/cart_item/:id' => "user/cart_items#update"
    get 'cart_items/confirm' => "user/cart_items#confirm"
    delete 'cart_items/destroy_all' => "user/cart_items#destroy_all", as: "cart_items_destroy_all"
    get 'new/user/order' => "user/orders#new"
    post 'user/orders/confirm' => "user/orders#confirm"
    resources :products, only: [:show]
    resources :orders,only: [:index, :show, :create, :update]
    resources :shippings
  end
  root "products#index"
  get 'top/about' => 'top#about'
  get "users/delete" => "users#delete", as: "users_delete"
  resources :users, only: [:show, :index, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
