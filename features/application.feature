Feature: Available in every page

  Scenario: Links in the page
    When I visit the 'Home' page
    Then I should see these links:
      | link          |
      | Home          |
      | Books         |
      | Patrons       |
      | Checkout book |
      | Checkin book  |
