Rails.application.routes.draw do
  devise_for :users
  resources :users
  get '/', to: 'users#index', as: 'home'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
    resources :likes, only: [:create]
      resources :comments, only: [:new, :create]
  end
end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'users#index'
end
