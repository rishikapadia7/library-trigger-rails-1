Given /^There is a '(.*)'$/ do |something|
  case something
    when 'patron'
      @patron = Patron.create(:first_name => 'Aldrin', :last_name => 'Almacin')
    when 'book'
      @available_book = Book.create(:title => 'MacArthur', :author => 'Bob Ong')
      @unavailable_book = Book.create(:title => 'Alamat ng Gubat', :author => 'Bob Ong', :checked_out => true)
  end
end

Then /^I should see a list of 'patrons'$/ do
  page.has_select?('Patron', :options => Patron.all.collect {|p| p.first_name})
end

Then /^I should see a list of 'available books'$/ do
  page.has_select?('Book', :options => Book.all.collect {|b| b.title})
end

Then /^I should see a list of 'unavailable books'$/ do
  page.should have_selector('p',:text => 'Books that are nice to have')
  Book.all.each do |book|
    page.should have_content book.title
  end
end
