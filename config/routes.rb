Rails.application.routes.draw do
  get 'books/index'
  get 'books/show'
  get 'books/new'
  get 'books/edit'
  get 'books/create'
  get 'users/add_to_fav'
  get 'users/remove_from_fav'
  resources :books
  devise_for :users
  resources :users, :only => [:index, :show, :add_to_fav, :remove_from_fav]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
