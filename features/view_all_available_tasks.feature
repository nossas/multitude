Feature: view all available tasks

  Scenario: when there is no available task
    Given there is an expired task
    When I go to "the homepage"
    Then I should see "a warning saying that there is no available task"

  Scenario: when there is at least one available task
    Given there is a task
    When I go to "the homepage"
    Then I should not see "a warning saying that there is no available task"
    And I should see "this task"
