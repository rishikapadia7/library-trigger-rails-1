Then /^I should see these links:$/ do |table|
  table.hashes.each do |link_hash|
    page.should have_selector('a', :text => link_hash[:link])
  end
end
