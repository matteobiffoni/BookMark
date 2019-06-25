class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
  end
  def show
    @user = User.find(params[:id])
  end
  def add_to_fav
    @book = Book.find(params[:book_param])
    if !current_user.books.include?(@book)
      current_user.books << @book
      current_user.save
    end
  end
  def remove_from_fav
    @book = Book.find(params[:book_param])
    if current_user.books.include?(@book)
      current_user.books.delete(@book)
      current_user.save
    end
  end
end
