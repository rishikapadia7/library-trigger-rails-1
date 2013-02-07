Feature: Edit a book

  Scenario Outline: Go to the edit book page
    When I visit the 'Edit book' page

    Scenarios: Check if edit form fields exists
      Then I should see all these fields:
        | field_name |
        | Title      |
        | Author     |
