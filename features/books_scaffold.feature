Feature: Scaffolded Books

  Scenario: Check if All book links are in the index page
    Given There is a 'book' and I am in the 'Books' page
    Then I should see all links relevant to books

  Scenario: Check if All books are listed
    Given There is a 'book' and I am in the 'Books' page
    Then I should see all books

  Scenario: Check if edit form fields exists
    Given There is a 'book' and I am in the 'Edit book' page
    Then I should see all edit book form fields

