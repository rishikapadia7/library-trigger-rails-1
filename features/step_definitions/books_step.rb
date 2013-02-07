Then /^I should see all books$/ do
  Book.all.each do |book|
    page.should have_content book.title
  end
end

When /^I click on the '(.*)' link with the value of first book$/ do |link_name|
  find(:xpath, "//p[contains(a,#{Book.first.title})]", :text => link_name).click
end
