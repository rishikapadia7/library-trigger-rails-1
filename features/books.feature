Feature: Scaffolded Books

  Scenario Outline: All going to books page
    When I visit the 'Books' page

    Scenarios: Check if All book links are in the index page
      Then I should see these links:
        | link     |
        | New Book |
        | Destroy  |
        | Edit     |
        | Show     |

    Scenarios: Check if All books are listed
      Then I should see all books

    Scenarios: Check if new book link is working
      And I click on the 'New Book' link
      Then I should see all these fields:
      | field_name |
      | Title      |
      | Author     |

