Then /^I should see checked out book$/ do
  puts "works should see all checked out books"
  page.should have_selector('p', @available_book.title)
end
