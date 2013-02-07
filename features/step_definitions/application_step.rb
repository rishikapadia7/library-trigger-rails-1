World(FactoryGirl::Syntax::Methods)
When /^I visit the '(.*)' page$/ do |page_name|
  case page_name
    when 'Home'
      visit root_path
    when 'Books'
      visit books_path
    when 'Patrons'
      visit patrons_path
    when 'Checkout'
      visit checkout_path
    when 'Checkin'
      visit checkin_path
    when 'History'
      visit history_path
    when 'Login'
      visit login_path
    when 'Edit book'
      visit edit_book_path(@book.id)
    else
      raise "The path is not visited".inspect
  end
end

When /^I click on the '(.*)' button$/ do |button_name|
  click_button button_name
end

Then /^I should see '(.*)'$/ do |text|
  page.should have_content text
end

When /^I click on the '(.*)' link$/ do |link_name|
  click_link link_name
end

Then /^I should be in the '(.*)' page$/ do |page_name|
  case page_name
    when 'Show book'
      current_url.should eq(show_book_path(@book.id))
  end
end

Then /^I should see a '(.*)' with '(.*)'$/ do |selector,text|
  page.should have_selector(selector,:text => text)
end

Then /^I should see all these fields:$/ do |field_names|
  field_names.hashes.each do |f|
    step("I should see the '#{f[:field_name]}' field")
  end
end

Then /^I should see the '(.*)' field$/ do |field_name|
  page.should have_field field_name
end

Then /^I should see these links:$/ do |table|
  table.hashes.each do |link_hash|
    page.should have_selector('a', :text => link_hash[:link])
  end
end
