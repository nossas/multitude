Feature: edit a task

  @ssi
  Scenario: when I'm logged in as admin
    Given I'm logged in as admin
    And there is a task
    When I'm in "this task page"
    Then I should see "the edit task button"
    Given I click in "the edit task button"
    And I fill in "the task title field" with "My new edited task"
    When I press "the edit task submit button"
    Then I should be in "this task page"
    And I should see "this task title"

  Scenario: when I'm not logged in as admin
    Given there is a task
    When I'm in "this task page"
    Then I should not see "the edit task button"
