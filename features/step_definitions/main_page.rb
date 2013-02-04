When /^I visit the '(.*)' page$/ do |page_name|
  case page_name
    when 'Home'
      visit root_path
  end
end

Then /^I should see '(.*)' in the page$/ do |text|
  page.should have_content text
end
