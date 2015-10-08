class BooksController < ApplicationController
  def index
    if params[:search]
      @books = Book.search(params[:search]).order('created_at DESC').paginate(page: params[:page])
    else
      @books = Book.order('created_at DESC').paginate(page: params[:page])
    end
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
      flash[:notice] = t 'books.flash.create.success'
      redirect_to @book
    else
      flash[:alert] = t 'books.flash.create.fail'
      render 'new'
    end
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      flash[:notice] = t 'books.flash.update.success'
      redirect_to @book
    else
      flash[:alert] = t 'books.flash.update.fail'
      render 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])

    @book.remove_cover!
    @book.destroy
    flash[:notice] = t 'books.flash.deleted'
    redirect_to books_path
  end

  def wish
    book = Book.find(params[:id])
    user = current_user

    BookNotifier.wish(user, book).deliver_later(wait: 5.seconds)
    flash[:notice] = t 'books.flash.notification'
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :authors, :isbn, :publisher, :published_date, :language, :pages, :category_id, :user_id, :cover)
  end
end
