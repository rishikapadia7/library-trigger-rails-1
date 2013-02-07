Then /^I should see all books$/ do
  Book.all.each do |book|
    page.should have_content book.title
  end
end

Then /^I should see all links relevant to books$/ do
  page.should have_link 'New Book'
  page.should have_link 'Destroy'
  page.should have_link 'Edit'
  page.should have_link 'Show'
end

When /^I click on the '(.*)' link with the value of first book$/ do |link_name|
  find(:xpath, "//p[contains(a,#{Book.first.title})]", :text => link_name).click
end

Given /^Check book$/ do
  raise Book.first.inspect
end
