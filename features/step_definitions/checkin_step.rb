Then /^I should see all checked out books$/ do
  page.should have_selector('p', @available_book.title)
end
