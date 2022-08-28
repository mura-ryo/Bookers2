Rails.application.routes.draw do
  get 'searches/search'
  devise_for :users
  root to: "homes#top"
  get "home/about" => "homes#about", as: "about"
  get "search" => "searches#search"
  
  resources :books, only: [:new, :index, :create, :show, :edit, :update, :destroy]do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end  
    
  resources :users, only: [:new, :index, :create, :show, :edit, :update]do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'  
  end  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #patch '/users/:id' => 'users#update', as: 'update'
end