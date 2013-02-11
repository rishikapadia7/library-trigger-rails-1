World(FactoryGirl::Syntax::Methods)
# Visit
When /^I visit the '(.*)' page$/ do |page_name|
  puts "works visit #{page_name}"
  visit path_of page_name
end

# Click Group
When /^I click on the '(.*)' button$/ do |button_name|
  puts "works click on the #{button_name} button"
  click_button button_name
end

When /^I click on the '(.*)' link$/ do |link_name|
  puts "works click on the #{link_name} link"
  click_link link_name
end

# Should see Group
Then /^I should see '(.*)'$/ do |text|
  puts "works should see #{text}"
  page.should have_content text
end

Then /^I should see a '(.*)' with '(.*)'$/ do |selector,text|
  puts "works #{selector}, with #{text}"
  page.should have_selector(selector,:text => text)
end

# Current path check
Then /^I should be in the '(.*)' page$/ do |page_name|
  puts "works should be in the #{page_name} page"
  current_path.should eq(path_of page_name)
end

# Field group
Then /^I should see the '(.*)' field$/ do |field_name|
  puts "works should see the #{field_name} field"
  page.should have_field field_name
end

Then /^I should see all these fields:$/ do |field_names|
  puts "works should see all these fields"
  field_names.hashes.each do |f|
    step("I should see the '#{f[:field_name]}' field")
  end
end

# Link group
Then /^I should see the '(.*)' link$/ do |link_name|
  puts "works should see the #{link_name} link"
  page.should have_link link_name
end
