class BookNotifier < ApplicationMailer
  def wish(user, book)
    @user = user
    @book = book
    mail(to: @book.user.email, subject: 'Someone liked your book', reply_to: @user.email)
  end
end
