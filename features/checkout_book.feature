Feature: Being able to checkout a book

  Background:
    When I visit the 'Checkout' page

  Scenario: Show the search box with submit
    Then I should see the 'Search patron' field

  Scenario: Fill in a search
    Then I fill in an author
    When I click on the 'Select button'
    Then I should see 'Search Results'
