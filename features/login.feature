Feature: The ability to login

  Scenario: Login message
    When I log in
    Then I should see 'Logged in!'

  Scenario: Login with invalid values
    When I log in with invalid attributes
    Then I should see 'Invalid email or password'
