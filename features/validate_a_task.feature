Feature: validate a task

  Scenario: when I'm not able to see the deliveries
    Given there is a task
    And somebody contributed for this task
    When I go to "this task page"
    Then I should see "the pending delivery"
    Then I should not see "the accept delivery button"

  @ssi
  Scenario: when I accept the delivery
    Given I'm logged in as admin
    And there is a task
    And somebody contributed for this task
    And I'm in "this task page"
    When I click in "the accept delivery button"
    Then I should be in "this task page"
    And I should see "the accepted delivery"
    And I should not see "the accept delivery button"

  @ssi
  Scenario: when I reject the delivery
    Given I'm logged in as admin
    And there is a task
    And somebody contributed for this task
    And I'm in "this task page"
    When I click in "the reject delivery button"
    Then I should be in "this task page"
    And I should see "the rejected delivery"

  @ssi
  Scenario: when my delivery is accepted
    Given I'm logged in
    And there is a task
    And I contributed for this task
    And my delivery is accepted
    When I go to "this task page"
    Then I should see "the accepted delivery"
    And I should see "the task completed warn"

  @ssi
  Scenario: when my delivery is rejected
    Given I'm logged in
    And there is a task
    And I contributed for this task
    And my delivery is rejected
    When I go to "this task page"
    Then I should see "the rejected delivery"
    And I should see "the task rejected warn"
    And I should see "the deliver task button"
