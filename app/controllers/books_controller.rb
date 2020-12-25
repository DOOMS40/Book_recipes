class BooksController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @books = Book.where(user: current_user).order(name: :desc).page(params[:page])
  end

  def show
    book_find
    @recipes = @book.recipes.page(params[:page])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user
    if @book.save 
      redirect_to @book 
    else
      render :new
    end
  end

  def edit
    book_find
  end

  def update
    book_find
    if @book.update(book_params)
      redirect_to books_path
    else
      render :edit
    end
  end

  def destroy
    book_find
    @book.destroy!
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:name, :image, :images, :genre, :user_id)
  end

  def book_find
    @book = Book.find(params[:id])
  end
end



 
  
  