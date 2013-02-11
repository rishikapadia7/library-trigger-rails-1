Feature: Scaffolded Books

  Background: All going to books page
    When I visit the 'Books' page

  Scenario Outline: Check if All book links are in the index page
    Then I should see the '<link>' link

    Examples:
      | link     |
      | New Book |
      | Destroy  |
      | Edit     |
      | Show     |

  Scenario: Check if All books are listed
    Then I should see all books

  Scenario Outline: Check if new book link is working
    And I click on the 'New Book' link
    Then I should see the '<field>' field

    Examples:
    | field      |
    | Title      |
    | Author     |

