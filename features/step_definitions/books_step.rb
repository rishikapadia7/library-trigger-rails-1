Then /^I should see all books$/ do
  Book.all.each do |book|
    page.should have_content book.title
  end
end

When /^I click on the '(.*)' link with the value of first book$/ do |link_name|
  find(:xpath, "//p[contains(a,#{Book.first.title})]", :text => link_name).click
end

Then /^I should see all fields with the book's values:$/ do
  page.should have_field('Title', :with => @book.title)
  page.should have_field('Author', :with => @book.author)
end

Then /^I should see all the values of the book$/ do
  page.should have_content(@book.title)
  page.should have_content(@book.author)
end
