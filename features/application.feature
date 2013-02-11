Feature: Stuff that are available throughout the site

  Scenario Outline: Links in the page
    When I visit the '<link>' page
    Then I should see the '<link>' link

    Examples:
      | link     |
      | Home     |
      | Books    |
      | Patrons  |
      | Checkout |
      | Checkin  |

  Scenario Outline: When links are clicked
    When I click on the '<link>' link
    Then I should be in the '<link>' page

    Examples:
      | link     |
      | Home     |
      | Books    |
      | Patrons  |
      | Checkout |
      | Checkin  |
