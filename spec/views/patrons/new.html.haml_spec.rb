require 'spec_helper'

describe "patrons/new" do
  before(:each) do
    assign(:patron, stub_model(Patron,
      :first_name => "MyString",
      :last_name => "MyString"
    ).as_new_record)
  end

  it "renders new patron form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => patrons_path, :method => "post" do
      assert_select "input#patron_first_name", :name => "patron[first_name]"
      assert_select "input#patron_last_name", :name => "patron[last_name]"
    end
  end
end
