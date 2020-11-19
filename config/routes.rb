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
    resources :products,only: [:index]
    resources :users,only: [:index]
    resources :orders,only: [:index]
    resources :categories,only: [:index]
  end
  devise_scope :user do
    get 'users/sign_up/done', to: 'users/registrations#done'
  end
  root "products#index"
  get 'top/about' => 'top#about'
  resources :users, only: [:show]
  resources :products, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
