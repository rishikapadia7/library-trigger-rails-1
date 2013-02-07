World(FactoryGirl::Syntax::Methods)
# Visit
When /^I visit the '(.*)' page$/ do |page_name|
  visit get_path(page_name)
end

# Click Group
When /^I click on the '(.*)' button$/ do |button_name|
  click_button button_name
end

When /^I click on the '(.*)' link$/ do |link_name|
  click_link link_name
end

# Should see Group
Then /^I should see '(.*)'$/ do |text|
  page.should have_content text
end

Then /^I should see a '(.*)' with '(.*)'$/ do |selector,text|
  page.should have_selector(selector,:text => text)
end

# Current path check
Then /^I should be in the '(.*)' page$/ do |page_name|
  current_path.should eq(get_path(page_name))
end

# Field group
Then /^I should see the '(.*)' field$/ do |field_name|
  page.should have_field field_name
end

Then /^I should see all these fields:$/ do |field_names|
  field_names.hashes.each do |f|
    step("I should see the '#{f[:field_name]}' field")
  end
end

# Link group
Then /^I should see these links:$/ do |table|
  table.hashes.each do |link_hash|
    page.should have_selector('a', :text => link_hash[:link])
  end
end
