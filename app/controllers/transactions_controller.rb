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

    if(@transaction.save)
      flash[:notice] = t('links.history.checked_out')
      redirect_to history_path
    end
  end

  def history
  end
end
