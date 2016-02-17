Feature: apply for a task

  @ssi
  Scenario: when the task is expired
    Given I'm logged in
    And there is an expired task
    When I'm in "this task page"
    Then I should not see "the apply for a task button"
    And I should see "the task expired button"

  @ssi
  Scenario: when the task is full
    Given I'm logged in
    And there is a full task
    When I'm in "this task page"
    Then I should not see "the apply for a task button"

  Scenario: when I'm not logged in
    Given there is a task
    When I'm in "this task page"
    Then I should see "the apply for a task button"
