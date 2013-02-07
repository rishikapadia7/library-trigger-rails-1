Feature: Book's edit feature
  Scenario: Go to the edit book page
    When I visit the 'Edit book' page
    Then I should see all fields with the book's values:
    When I click on the 'Save' button
    Then I should see all the values of the book
