Rails.application.routes.draw do
  devise_for :users, controllers: {
  	registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'users/sign_up/done', to: 'users/registrations#done'
  end
  root "products#index"
  get 'top/about' => 'top#about'
  resources :users, only: [:show]
  resources :products, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
