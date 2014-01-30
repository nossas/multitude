Feature: deliver a task

  @ssi @javascript
  Scenario: when I submit a valid form
    Given I'm logged in
    And there is a task
    And I applied for this task
    And I'm in "this task page"
    And I fill in "the delivery text field" with "It's done!"
    And I attach "the delivery file" in "the delivery file field"
    When I press "the delivery submit button"
    Then I should be in "this task page"
    And I should see "my delivery"
