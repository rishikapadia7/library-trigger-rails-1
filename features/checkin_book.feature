Feature: Being able to check in book

  Background:
    When I visit the 'Checkin' page

  Scenario:
    Then I should see checked out book

  Scenario:
    And I click on the 'Checkin this book' link
    Then I should see 'is successfully checked in.'
