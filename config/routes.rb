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
    get 'cart_items/confirm' => "user/cart_items#confirm"
  delete 'cart_items/destroy_all' => "user/cart_items#destroy_all", as: "cart_items_destroy_all"
    resources :cart_items, only: [:update, :create, :destroy]
    resources :products, only: [:show]

  end
  root "products#index"
  get 'top/about' => 'top#about'
  resources :users, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
