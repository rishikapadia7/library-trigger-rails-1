Feature: Being able to checkout a book

  Scenario: Show a list of patrons
    Given There is a 'patron'
    When I visit the 'Checkout' page
    Then I should see a list of 'patrons'

  Scenario: Show a list of available books
    Given There is a 'book'
    When I visit the 'Checkout' page
    Then I should see a list of 'available books'

  Scenario: Show a list of unavailable books
    Given There is a 'book'
    When I visit the 'Checkout' page
    Then I should see a list of 'unavailable books'
