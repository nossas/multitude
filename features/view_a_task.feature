Feature: view a task

  Scenario: when I'm logged in
    Given I'm logged in
    And there is a task
    When I go to "this task page"
    Then I should see "this task title"

  Scenario: when I'm an admin
  Scenario: when I'm not logged in
