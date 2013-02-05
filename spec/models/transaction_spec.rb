require 'spec_helper'

describe Transaction do
  before(:each) do
    @transaction = Transaction.new(:id => 1, :book_id => 1, :patron_id => 1)
  end

  it "should be valid with the right attributes" do
    @transaction.should be_valid
  end

  it "should be have a patron id" do
    @transaction.patron_id = nil
    @transaction.should_not be_valid
  end

  it "should be have a book id" do
    @transaction.book_id = nil
    @transaction.should_not be_valid
  end
end
