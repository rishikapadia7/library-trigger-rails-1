class TransactionsController < ApplicationController
  def checkout
    @transaction = Transaction.new
    @unavailable_books = Book.where(:checked_out => true)
  end

  def checkin
  end

  def create
    @transaction = Transaction.new(params[:transaction])

    if(@transaction.save)
      flash[:notice] = t('links.history.transaction_done')
      redirect_to history_path
    end
  end

  def history
  end
end
