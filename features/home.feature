Feature: The home page

  Scenario: Show welcome message
    When I visit the 'Home' page
    Then I should see 'Welcome to the mosaic library'
