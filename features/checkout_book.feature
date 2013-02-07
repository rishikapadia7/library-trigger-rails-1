Feature: Being able to checkout a book

  Scenario Outline: Show lists
    Given There is a '<object>' and I am in the 'Checkout' page
    Then I should see a list of '<objects>'

  Scenarios: Show a list of patrons
    | object | objects |
    | patron | patrons |

  Scenarios: Show a list of available books
    | object | objects         |
    | book   | available books |

  Scenarios: Show a list of unavailable books
    | object | objects           |
    | book   | unavailable books |

  Scenario: Show error message after invalid input
    When I visit the 'Checkout' page
    And I click on the 'Checkout' button
    Then I should see 'prohibited the'

  Scenario: Show success message after valid input
    Given There is a 'patron'
    And There is a 'book'
    When I visit the 'Checkout' page
    And I fill in the checkout fields
    And I click on the 'Checkout' button
    Then I should see 'successfully'

