Feature: deliver a task

  @ssi
  Scenario: when I submit a valid form
    Given I'm logged in
    And there is a task
    And I subscribed for this task
    And I'm in "this task page"
    And I fill in "the delivery text field" with "It's done!"
    And I attach "the delivery file" in "the delivery file field"
    When I press "the delivery submit button"
    Then I should be in "this task page"
    And I should see "my delivery"
    And I should see "the wait for validation warn"
    And an email should be sent to the creator of the task
