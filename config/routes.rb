Rails.application.routes.draw do
  get 'books/index'
  get 'books/search'
  get 'books/show'
  get 'books/new'
  get 'books/edit'
  get 'books/create'
  get 'users/add_to_fav'
  get 'users/remove_from_fav'
  get 'users/add_writer'
  get 'users/remove_writer'
  resources :books
  devise_for :users
  resources :users, :only => [:index, :show, :add_to_fav, :remove_from_fav, :add_writer, :remove_writer]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
