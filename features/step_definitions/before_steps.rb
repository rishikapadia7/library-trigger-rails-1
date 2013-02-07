Given /^Create all objects$/ do
  @patron = create(:patron)
  @book = create(:book)
  @available_book = create(:available_book)
  @unavailable_book = create(:unavailable_book)

  @unfinished_transaction = create(:transaction, :patron_id => @patron.id, :book_id => @book.id, :checkin_date => nil)

  @finished_transaction = create(:transaction ,:patron_id => @patron.id, :book_id => @book.id)

  @user = create(:user)
end

Given /^I log in$/ do
  visit login_path

  fill_in 'Email', :with => @user.email
  fill_in 'Password', :with => @user.password

  step("I click on the 'Log in' button")
end
