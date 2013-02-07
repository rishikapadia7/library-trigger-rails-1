Feature: Stuff that are available throughout the site

  Scenario Outline: Links in the page
    When I visit the '<link>' page
    Then I should see these links:
      | link          |
      | Home          |
      | Books         |
      | Patrons       |
      | Checkout book |
      | Checkin book  |
      | Log out       |

  Scenario Outline: When links are clicked
    When I click on the '<link>' link
    Then I should be in the '<link>' page

    Scenarios: When i visit the Home page
      | link      |
      | Home      |

    Scenarios: When i visit the Checkout page
      | link      |
      | Checkout  |

    Scenarios: When i visit the Patrons  page
      | link      |
      | Patrons   |

    Scenarios: When i visit the Books  page
      | link      |
      | Books     |

    Scenarios: When i visit the Checkin  page
      | link      |
      | Checkin   |
