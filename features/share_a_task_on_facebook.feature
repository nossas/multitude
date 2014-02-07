Feature: share a task on Facebook

  Scenario:
    Given there is a task
    When I go to "this task page"
    Then I should see "the Facebook share button of this task"
