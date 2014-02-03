Feature: apply for a task

  @ssi
  Scenario: when I'm logged in
    Given I'm logged in
    And there is a task
    And I'm in "this task page"
    When I click in "the apply for a task button"
    Then I should see "the remaining warn for this task"
    And I should not see "the apply for a task button"

  @ssi
  Scenario: when the task is expired
    Given I'm logged in
    And there is an expired task
    When I'm in "this task page"
    Then I should not see "the apply for a task button"

  @ssi
  Scenario: when the task is full
    Given I'm logged in
    And there is a full task
    When I'm in "this task page"
    Then I should not see "the apply for a task button"
