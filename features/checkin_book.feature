Feature: Check in book

  Scenario: Show all the books borrowed
    Given There is a 'book'
    When I visit the 'Checkin' page
    Then I should see a list of 'unavailable books'
