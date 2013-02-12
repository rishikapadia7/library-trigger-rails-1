module BooksHelper
  def full_title_of book
    book.title + ' by ' + book.author
  end
end
