Feature: view a task

  Scenario:
    Given there is a task
    When I go to "this task page"
    Then I should see "this task title"
    And I should see "this task category"
    And I should see "this task hashtag"    
    And I should see "this task deadline"
    And I should see "this task description"
    And I should see "this task skills"
