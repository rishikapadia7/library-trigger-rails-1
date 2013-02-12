class TransactionsController < ApplicationController
  before_filter :build_objects,:check_logged_in

  def checkout
    @transaction = Transaction.new
    @patrons_searched = Patron.search(params[:search_patron])
    respond_to do |format|
      format.html
      format.js {render 'checkout.js'}
    end
  end

  def checkin
    @unfinished_transactions = paginate_the Transaction.where(:checkin_date => nil)
  end

  def select_book_checkout
    if session[:patron_selected].nil?
      session[:patron_selected] = params[:patron]
    end
    @books_searched = Book.search(params[:search_books])
  end

  def checkin_book
    @transaction = Transaction.find(params[:transaction_id])
    @transaction.update_attributes(:checkin_date => Time.now)
    @book = Book.find(@transaction.book_id)

    @book.update_attributes(:checked_out => false)
    flash[:notice] = @book.title + ' is successfully checked in.'
    redirect_to checkin_path
  end

  def checkout_book
    unless params[:books].nil? || session[:patron_selected].nil?
      params[:books].keys.each do |book_id|
        Transaction.create(
          :patron_id => session[:patron_selected],
          :book_id => book_id,
          :checkout_date => Time.now,
          :checkin_date => nil
        )
      end
      session[:patron_selected] = nil
      redirect_to checkin_path, :notice => "Books are now checked out"
    else
      redirect_to checkout_path, :notice => "You must select a book and a patron."
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
