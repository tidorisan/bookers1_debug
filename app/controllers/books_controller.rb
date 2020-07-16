class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
  end

  def create
    # create なので@不要
    book = Book.new(book_params)
    if book.save
      redirect_to book_path(book), notice: "successfully created book!"
    else
      # render での移行　ページに渡すオブジェクトを生成する必要がある
      @books = Book.all
      @book = Book.new
      flash[:notice] = "error_can't be blank"
      render 'index'
    end
  end

  def edit
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      redirect_to book_path(@book), notice: "successfully updated book!"
    else
      flash[:notice] = "error"
      render 'edit'
    end
  end

  def destroy
  	@book.destroy
  	redirect_to books_path, notice: "successfully delete book!"
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
