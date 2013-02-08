Feature: Book's edit feature

  Scenario: Hit on save with no changes
    When I visit the 'Edit book' page
    When I click on the 'Save' button
    Then I should see all the values of the book

  Scenario: See the books values
    When I visit the 'Edit book' page
    Then I should see all fields with the book's values:
