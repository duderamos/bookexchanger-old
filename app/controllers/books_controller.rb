class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to @book
    else
      render 'new'
    end
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to @book
    else
      render 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])

    @book.remove_picture!
    @book.destroy
    redirect_to books_path
  end

  def wish
    book = Book.find(params[:id])
    user = current_user

    BookNotifier.wish(user, book).deliver_later(wait: 5.seconds)
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :authors, :isbn, :publisher, :published_date, :language, :pages, :category_id, :user_id, :cover)
  end
end
