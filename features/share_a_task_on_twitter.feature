Feature: share a task on Twitter

  Scenario:
    Given there is a task
    When I go to "this task page"
    Then I should see "the Twitter share button of this task"
