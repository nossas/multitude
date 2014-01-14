Feature: create a task

  Scenario: when I'm logged in
    Given I'm logged in
    And I click in "the new task button"
    And I fill in "the task title field" with "My new task"
    And I check "the task remote field"
    And I fill in "the task description field" with "My new task description"
    And I select "Organizar coletiva de imprensa" from "the task type field"
    And I fill in "the task points field" with "20"
    And I fill in "the task minimum capacity field" with "5"
    And I fill in "the task deadline field" with "07/01/2014"
    And I fill in "the task material field" with "My new task description"
    And I fill in "the task handout field" with "My new task description"
    And I fill in "the task deliverable field" with "My new task description"
    And I check "the task programming skill field"
    When I press "the new task submit button"
    Then I should be in "the new task page"

  Scenario: when I'm not logged in
  Scenario: when I submit the form with errors
