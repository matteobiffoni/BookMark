class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :require_writer, only: [:new, :create, :edit, :update, :destroy]
  include ApplicationHelper

  # GET /books
  # GET /books.json

# GET /books
  # GET /books.json
  #def index
   # @books = Book.all
  #end

#per la ricerca parte da qui
def index
  @books = if params[:book]
    Book.where('title LIKE ?', "%#{params[:book]}%") || Book.where('writer LIKE ?', "%#{params[:book]}%")
  else
    Book.all
  end
end

  def task_params
    params.require(:task).permit(:name, :complete, :due_date, :term)
  end
#finisce qui

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params.merge(writer_id: current_user.id))

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Libro caricato correttamente' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Libro aggiornato correttamente' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Libro eliminato correttamente' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :genre, :amazon, :plot, :year)
    end

    def require_writer
      unless has_role?(:writer)
        render 'shared/_writerneeded'
      end
    end
end
