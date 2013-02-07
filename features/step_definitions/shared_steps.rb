World(FactoryGirl::Syntax::Methods)

Given /^There is a '(.*)'$/ do |something|
  case something
    when 'patron'
      @patron = create(:patron)
    when 'book'
      @available_book = create(:book, :checked_out => false)
      @book = create(:book, :title => Faker::Lorem.word)
      @unavailable_book = create(:book, :title => Faker::Lorem.word, :checked_out => true)
    when 'transaction'
      @unfinished_transaction = create(:transaction, :patron_id => @patron.id, :book_id => @book.id, :checkin_date => nil)
      @finished_transaction = create(:transaction ,:patron_id => @patron.id, :book_id => @book.id)
    else
      raise "The object is not built".inspect
  end
end

When /^I visit the '(.*)' page$/ do |page_name|
  step('I log in')
  case page_name
    when 'Home'
      visit root_path
    when 'Checkout'
      visit checkout_path
    when 'Books'
      visit books_path
    when 'Edit book'
      visit edit_book_path(@book.id)
    when 'Checkin'
      visit checkin_path
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
  puts page.body
  click_link link_name
end

Then /^I should be in the '(.*)' page$/ do |page_name|
  case page_name
    when 'Show book'
      current_url.should eq(show_book_path(@book.id))
  end
end

Then /^I should see a '(.*)' with '(.*)'$/ do |selector,text|
  puts "BODY \n " + page.body
  page.should have_selector(selector,:text => text)
end

When /^I log in$/ do
  @user = create(:user)
  visit login_path

  fill_in 'Email', :with => @user.email
  fill_in 'Password', :with => @user.password
  step("I click on the 'Log in' button")
end
