Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :admin_users
  devise_for :users
  
  root "static_pages#show", page: "home"
  
  resources :users, only: [:index, :show] do
    resources :reviews, except: :index
  end
  resources :books, only: [:index, :show] do
    resources :rates, only: [:create]
    resource :suggest_books, only: :create
  end
  resources :reviews do
    resources :comments
    resources :likes, only: [:create, :destroy]
  end
  resources :authors, only: [:index, :show]
  resources :categories, only: [:index, :show]
  resources :comments
  get "users/:id/reviews" => "users#reviews", as: :user_all_reviews
  get "static_pages/about", as: :about
  get "static_pages/easter", as: :easter
  
  get 'search', to: 'books#search'
end
