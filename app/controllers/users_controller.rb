class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
  end
  def show
    @user = User.find(params[:id])
  end
  def add_to_fav
    if !current_user.has_role? :publisher
      @book = Book.find(params[:book_param])
      if !current_user.books.include?(@book)
        current_user.books << @book
        current_user.save
      end
    end
  end
  def remove_from_fav
    if !current_user.has_role? :publisher
      @book = Book.find(params[:book_param])
      if current_user.books.include?(@book)
        current_user.books.delete(@book)
        current_user.save
      end
    end
  end
  def add_writer
    if current_user.has_role? :publisher
      @writer = User.find(params[:writer_to_add])
      if @writer
        if !current_user.writers.include?(@writer) && @writer.publisher == nil
          current_user.writers << @writer
          current_user.save
        else
          render 'already_there'
        end
      else
        render '_no_user_found'
      end
    end
  end
  def remove_writer
    if current_user.has_role? :publisher
      @writer = User.find(params[:writer_to_remove])
      if current_user.writers.include?(@writer) && @writer.publisher == current_user
        current_user.writers.delete(@writer)
        current_user.save
        @writer.publisher = nil
        @writer.save
      else
        render '_no_user_found'
      end
    end
  end
end
