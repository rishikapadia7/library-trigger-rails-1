Feature: Book's edit feature

  Background:
    When I visit the 'Edit book' page

  Scenario: Hit on save with no changes
    When I click on the 'Save' button
    Then I should see all the values of the book

  Scenario: See the books values
    Then I should see all fields with the book's values
