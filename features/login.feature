Feature: Log in checks

  Scenario: Make sure login page is not seen when logged in
    When I visit the 'Login' page
    Then I should see 'You are already logged in!'


  Scenario: Login with invalid values
    When I click on the 'Log out' link
    And I log in with invalid attributes
    Then I should see 'Invalid email or password'
