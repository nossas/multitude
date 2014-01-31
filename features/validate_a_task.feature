Feature: validate a task
  
  Scenario: when I'm not able to see the deliveries
    Given there is a task
    And there is a delivery for this task awaiting approval
    When I go to "this task page"
    Then I should not see "the pending delivery"

  @ssi
  Scenario: when I accept the delivery
    Given I'm logged in as admin
    And there is a task
    And there is a delivery for this task awaiting approval
    And I'm in "this task page"
    When I click in "the accept delivery button"
    Then I should be in "this task page"
    And I should see "the accepted delivery"
    And I should not see "the accept delivery button"
    And an email should be sent to the creator of the delivery

  @ssi
  Scenario: when I reject the delivery
    Given I'm logged in as admin
    And there is a task
    And there is a delivery for this task awaiting approval
    And I'm in "this task page"
    When I click in "the reject delivery button"
    Then I should be in "this task page"
    And I should see "the rejected delivery"
    And an email should be sent to the creator of the delivery

  @ssi
  Scenario: when my delivery is accepted
    Given I'm logged in    
    And there is a task
    And I applied for this task
    And my delivery is accepted
    When I go to "this task page"
    Then I should see "the accepted delivery"
    And I should see "the task completed warn"
    And I should see "the task completed button"

  @ssi
  Scenario: when my delivery is rejected
    Given I'm logged in
    And there is a task
    And I applied for this task
    And my delivery is rejected
    When I go to "this task page"
    Then I should see "the rejected delivery"
    And I should see "the task rejected warn"
    And I should see "the redeliver task button"
