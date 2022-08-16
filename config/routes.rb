Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  #get "/about", => "homes#about", as: "home/about"
  get "home/about" => "homes#about", as: "about"
  #get '/about', to: 'homes#about'
  resources :books, only: [:new, :index, :create, :show, :edit, :update, :destroy]
  resources :users, only: [:new, :index, :create, :show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #patch '/users/:id' => 'users#update', as: 'update'
end