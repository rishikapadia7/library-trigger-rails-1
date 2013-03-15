class BooksController < ApplicationController
  #before_filter :check_logged_in
  # GET /books
  # GET /books.json
  def index
    @books = paginate_the Book.order('title')

    respond_to do |format|
      format.html # index.html.erb
      format.js { head :no_content }
      format.json { render :json => @books }
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @book = Book.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @book }
    end
  end

  # GET /books/new
  # GET /books/new.json
  def new
    @book = Book.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @book }
    end
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(params[:book])

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice => 'Book was successfully created.' }
        format.json { render :json => @book, status => :created, location => @book }
      else
        format.html { render action => "new" }
        format.json { render :json => @book.errors, status => :unprocessable_entity }
      end
    end
  end

  # PUT /books/1
  # PUT /books/1.json
  def update
    @book = Book.find(params[:id])

    respond_to do |format|
      if @book.update_attributes(params[:book])
        format.html { redirect_to @book, notice => 'Book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action => "edit" }
        format.json { render :json => @book.errors, status => :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book = Book.find(params[:id])
    Transaction.where(:book_id => @book.id).destroy_all
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url }
      format.js { head :no_content }
      format.json { head :no_content }
    end
  end
end
