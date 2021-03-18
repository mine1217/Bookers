class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    if book.save
      redirect_to book_path(book), flash: {success: "successfully to create"}
    else
      flash[:alert] = "error to create"
      @books= Book.all
      @book = book
      render 'index'
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      redirect_to book_path(book), flash: {success: "successfully to update"}
    else
      flash[:alert] = "error to edit"
      @book = book
      render 'edit'
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
     redirect_to books_path, flash: {success: "successfully to destroy"}
    else
      flash[:alert] = "error to destroy"
      @books= Book.all
      @book = book
      render 'index'
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
