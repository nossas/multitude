Feature: apply for a task

  @ssi @javascript
  Scenario: when I'm logged in
    Given I'm logged in
    And there is a task
    And I'm in "this task page"
    When I click in "the apply for a task button"
    Then I should see "the remaining warn for this task"
    And I should see "the thank you for applying message"
    And I should not see "the apply for a task button"
    And I should receive an email
    And the email 'I applied for your task' should be sent to the task owner

  @ssi
  Scenario: when the task is expired
    Given I'm logged in
    And there is an expired task
    And I'm in "this task page"
    When I click in "the apply for a task button"
    Then I should see "the remaining warn for this task"
    And I should see "the thank you for applying message"
    And I should not see "the apply for a task button"
    And I should receive an email
    And the email 'I applied for your task' should be sent to the task owner

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
