Feature: apply for a task

  Scenario: when I'm logged in
    Given I'm logged in
    And there is a task
    And I'm in "this task page"
    When I click in "the apply for a task button"
    Then I should see "a successful message"
    And I should not see "the apply for a task button"

  Scenario: when I already applied for the task
  Scenario: when I'm not logged in
