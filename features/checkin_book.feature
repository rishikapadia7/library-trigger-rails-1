Feature: Being able to check in book

  Scenario:
    Given There is a 'book' and I am in the 'Checkin' page
    Then I should see all checked out books

  Scenario:
    Given There is a 'book'
    And There is a 'patron'
    And There is a 'transaction'
    When I visit the 'Checkin' page
    And I click on the 'Checkin this book' link
    Then I should see a 'p' with 'is successfully checked in.'
