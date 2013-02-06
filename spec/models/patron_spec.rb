require 'spec_helper'

describe Patron do
  before(:each) do
    @patron = Patron.new(:id => 1, :first_name => 'Aldrin', :last_name => 'Aldrin')
  end

  it("should be valid with the right attributes") do
    @patron.should be_valid
  end

  it "should have first name" do
    @patron.first_name = nil
    @patron.should_not be_valid
  end

  it "should have last name" do
    @patron.last_name = nil
    @patron.should_not be_valid
  end
end
