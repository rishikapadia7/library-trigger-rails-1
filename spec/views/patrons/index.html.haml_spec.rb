require 'spec_helper'

describe "patrons/index" do
  before(:each) do
    assign(:patrons, [
      stub_model(Patron,
        :first_name => "First Name",
        :last_name => "Last Name"
      ),
      stub_model(Patron,
        :first_name => "First Name",
        :last_name => "Last Name"
      )
    ])
  end

  it "renders a list of patrons" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
  end
end
