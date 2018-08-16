Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
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
end
