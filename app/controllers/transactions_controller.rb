class TransactionsController < ApplicationController
  #before_filter :redirect_if_not_logged_in
  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = Transaction.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @transactions }
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
  end

  def checkout
    @transaction = Transaction.new
    @transactions = Transaction.all
  end

  def checkin_action
    @transaction = Transaction.find(params[:transaction_id])
    @transaction.update_attributes(:checkin_date => Time.now)

    @book = Book.find(@transaction.book_id)
    @book.update_attributes(:checked_out => false)

    redirect_to checkin_path, :notice => "Succesfully Checked in!"
  end
end
