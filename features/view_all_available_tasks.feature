Feature: view all available tasks

  Scenario: when there is no available task
    Given there is a full task
    When I go to "the homepage"
    Then I should see "a warning saying that there is no available task"

  @javascript
  Scenario: when there is an expired task
    Given there is an expired task
    When I go to "the homepage"
    Then I should not see "a warning saying that there is no available task"
    And I should see "this task"

  @javascript
  Scenario: when there is an available task
    Given there is a task
    When I go to "the homepage"
    Then I should not see "a warning saying that there is no available task"
    And I should see "this task"

  @javascript
  Scenario: when there are more than one page of available tasks
    Given there are 9 a tasks
    When I go to "the homepage"
    Then I should see 8 tasks
    When I click in "the load more available tasks button"
    Then I should see 9 tasks
    And I should not see "the load more available tasks button"
