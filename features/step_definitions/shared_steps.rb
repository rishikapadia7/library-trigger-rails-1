World(FactoryGirl::Syntax::Methods)

Given /^There is a '(.*)'$/ do |something|
  case something
    when 'patron'
      @patron = create(:patron)
    when 'book'
      @available_book = create(:book, :checked_out => false)
      @book = create(:book, :title => Faker::Lorem.word)
      @unavailable_book = create(:book, :title => Faker::Lorem.word, :checked_out => true)
  end
end

When /^I visit the '(.*)' page$/ do |page_name|
  case page_name
    when 'Home'
      visit root_path
    when 'Checkout'
      visit checkout_path
    when 'Books'
      visit books_path
    when 'Edit book'
      visit edit_book_path(@book.id)
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

