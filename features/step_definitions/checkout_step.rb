Then /^I should see a list of 'patrons'$/ do
  puts "works should see a list of patrons"
  page.should have_select 'transaction_patron_id'
end

Then /^I should see a list of 'available books'$/ do
  puts "works should see a list of available books"
  page.should have_select 'transaction_book_id'
end

Then /^I should see a list of 'unavailable books'$/ do
  puts "works should see a list of unavailable books"
  page.should have_selector('p', :text => 'Books that are currently checked out')
  Book.where(:checked_out => true).each do |book|
    page.should have_content book.title
  end
end

When /^I fill in the checkout fields$/ do
  puts "works fill in the checkout fields"
  page.select @patron.last_name, :from => 'transaction_patron_id'
  page.select @available_book.title, :from => 'transaction_book_id'
end
