class TransactionsController < ApplicationController
  def checkout
    @transaction = Transaction.new
    @patrons = Patron.all
    @available_books = Book.where(:checked_out => false)
    @unavailable_books = Book.where(:checked_out => true)
  end

  def checkin
  end

  def create
    @transaction = Transaction.new(params[:transaction])
    @transaction.checkout_date = Time.now
    @patrons = Patron.all
    @available_books = Book.where(:checked_out => false)
    @unavailable_books = Book.where(:checked_out => true)

    if(@transaction.save)
      @book = Book.find(@transaction.book_id)
      @book.update_attributes(:checked_out => true)

      flash[:notice] = @book.title + ' is successfuly checked out.'
      redirect_to history_path
    else
      flash[:notice] = ['There is an error']
      @transaction.errors.full_messages.each do |message|
        flash[:notice] << message
      end
      redirect_to checkout_path
    end
  end

  def history
  end
end
