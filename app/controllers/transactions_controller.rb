class TransactionsController < ApplicationController
  #before_filter :redirect_if_not_logged_in
  # GET /transactions
  # GET /transactions.json
  def index
    
    @transactions = []
    Transaction.all.each do |transaction|
      if transaction.book && transaction.patron
        @transactions.append(transaction)
      end
    end

    @transactions.sort_by! &:updated_at
    @transactions.reverse!

    #.order('checkout_date')
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @transactions.as_json }
    end
  end

  
  # POST /transactions
  # POST /transactions.json
  def create
    selected_date = DateTime.new(
      params[:checkout_datetime].values[0].to_i,
      params[:checkout_datetime].values[1].to_i,
      params[:checkout_datetime].values[2].to_i,
      params[:checkout_datetime].values[3].to_i,
      params[:checkout_datetime].values[4].to_i
    )
    #raise selected_date.inspect
    params[:books].values.each do |book_id|
      @transaction = Transaction.new(
        :patron_id => params[:patron].values.first,
        :book_id => book_id,
        :checkout_date => selected_date
        )
      if @transaction.save
        @book = Book.find(book_id.to_i)
        @book.update_attributes(:checked_out => true)
      end

    end
    
    if @transaction.save
      @book = Book.find(@transaction.book_id)
      @book.update_attributes(:checked_out => true)
      
      redirect_to checkout_path, :notice => 'Checkout completed successfully.'
    else
      render 'checkout'
    end
  end

  def update
    @transaction = Transaction.find(params[:id])

    if @patron.update_attributes(params[:patron])
      redirect_to home_path
    else
      render 'edit'
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction = Transaction.find(params[:id])
    
    if @transaction.checkin_date.blank? || @transaction.checkin_date.nil?
      @book = Book.find(@transaction.book_id)
      @book.update_attributes(:checked_out => false)
    end

    @transaction.destroy

    respond_to do |format|
      format.html { redirect_to transactions_url }
      format.js { head :no_content }
      format.json { head :no_content }
    end
  end

  def checkin
    @transactions = Transaction.all
    @open_transactions = []
    @transactions.each do |transaction|
      if transaction.book != nil && transaction.patron
        if transaction.book.checked_out == true
          @open_transactions.append(transaction)
        end
      end
    end

    @open_transactions.sort_by! &:checkout_date
    
    respond_to do |format|
      format.html
      format.json { render :json => @open_transactions.as_json }
    end

  end

  def checkout
    @transaction = Transaction.new
    @transactions = Transaction.all

    @ready_transactions = []


    @transactions.each do |transaction|
      if transaction.book != nil && transaction.patron
        if transaction.book.checked_out == false
          @ready_transactions.append(transaction)
        end
      end
    end

    @ready_transactions.sort_by! &:updated_at
    @ready_transactions.reverse!

    respond_to do |format|
      format.html
      format.json { render :json => @ready_transactions.as_json }
    end


  end

  def checkin_action
    @transaction = Transaction.find(params[:transaction_id])
    @transaction.update_attributes(:checkin_date => Time.now)

    @book = Book.find(@transaction.book_id)
    @book.update_attributes(:checked_out => false)

    respond_to do |format|
      format.js { head :no_content }
      format.json { head :no_content }
    end
  end
end
