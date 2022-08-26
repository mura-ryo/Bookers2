Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  #get "/about", => "homes#about", as: "home/about"
  get "home/about" => "homes#about", as: "about"
  #get '/about', to: 'homes#about'
  resources :books, only: [:new, :index, :create, :show, :edit, :update, :destroy]do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end  
    
  resources :users, only: [:new, :index, :create, :show, :edit, :update]
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #patch '/users/:id' => 'users#update', as: 'update'
end