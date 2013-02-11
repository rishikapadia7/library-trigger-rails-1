Feature: Being able to check in book

  Scenario:
    When I visit the 'Checkin' page
    Then I should see all checked out books

  Scenario:
    When I visit the 'Checkin' page
    And I click on the 'Checkin this book' link
    Then I should see 'is successfully checked in.'
