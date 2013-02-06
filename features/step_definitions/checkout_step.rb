Then /^I should see a list of 'patrons'$/ do
  page.should have_select 'transaction_patron_id'
end

Then /^I should see a list of 'available books'$/ do
  page.should have_select 'transaction_book_id'
end

Then /^I should see a list of 'unavailable books'$/ do
  page.should have_selector('p', :text => 'Books that are currently checked out')
  Book.where(:checked_out => true).each do |book|
    page.should have_content book.title
  end
end
