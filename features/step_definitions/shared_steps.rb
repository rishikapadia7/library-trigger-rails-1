When /^I click on the '(.*)' button$/ do |button_name|
  click_button button_name
end

Then /^I should see '(.*)'$/ do |text|
  page.should have_content text
end
