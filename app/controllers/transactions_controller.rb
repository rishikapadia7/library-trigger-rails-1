class TransactionsController < ApplicationController
  before_filter :build_objects

  def checkout
    @transaction = Transaction.new
  end

  def checkin
    @unfinished_transactions = Transaction.where(:checkin_date => nil)
  end

  def checkin_book
    @transaction = Transaction.find(params[:transaction_id])
    @transaction.update_attributes(:checkin_date => Time.now)
    @book = Book.find(@transaction.book_id)

    @book.update_attributes(:checked_out => false)
    flash[:notice] = @book.title + ' is successfully checked in.'
    redirect_to checkin_path
  end

  def create
    @transaction = Transaction.new(params[:transaction])
    @transaction.checkout_date = Time.now

    if(@transaction.save)
      @book = Book.find(@transaction.book_id)
      @book.update_attributes(:checked_out => true)

      flash[:notice] = @book.title + ' is successfully checked out.'
      redirect_to history_path
    else
      render :action => 'checkout'
    end
  end

  def history
    @transactions = Transaction.where('checkin_date is NOT NULL')
  end

  def delete
    Transaction.find(params[:transaction_id]).destroy
    flash[:notice] = 'Deleted transaction'
    redirect_to history_path
  end

  protected
    def build_objects
      @patrons = Patron.all
      @available_books = Book.where(:checked_out => false)
      @unavailable_books = Book.where(:checked_out => true)
    end
end
