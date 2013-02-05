require 'spec_helper'

describe Book do
  before(:each) do
    @book = Book.new(:id => 1, :title => 'MacArthur', :author => 'Bob Ong')
  end

  it "should be valid with the right attributes" do
    @book.should be_valid
  end

  it "should have a title" do
    @book.title = nil
    @book.should_not be_valid
  end

  it "should have an author" do
    @book.author = nil
    @book.should_not be_valid
  end
end
