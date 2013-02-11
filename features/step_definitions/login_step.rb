When /^I log in with invalid attributes$/ do
  puts "works login with invalid attributes"
  visit login_path

  fill_in 'Email', :with => 'blablabla'
  fill_in 'Password', :with => 'blablabla'

  step("I click on the 'Log in' button")
end
