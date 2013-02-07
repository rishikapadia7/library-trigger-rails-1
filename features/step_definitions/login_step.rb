
When /^I log in with invalid attributes$/ do
  visit login_path

  fill_in 'Email', :with => 'blablabla'
  fill_in 'Password', :with => 'blablabla'

  step("I click on the 'Log in' button")
end
