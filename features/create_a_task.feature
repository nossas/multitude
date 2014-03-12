Feature: create a task

  Background:
    Given there is a mobilization called "A Ponte do Rio Que Cai"
    And there is a task type called "Organizar coletiva de imprensa"

  @ssi
  Scenario: when there is a match between the task and an user
    Given I'm logged in as admin
    And there is an user with the "programming" skill
    And I click in "the new task button"
    And I fill in "the task title field" with "My new task"
    And I fill in "the task description field" with "My new task description"
    And I select "Organizar coletiva de imprensa" from "the task type field"
    And I fill in "the task points field" with "20"
    And I fill in "the task call to action field" with "Go!"
    And I fill in "the task max deliveries field" with "5"
    And I fill in "the task deadline field" with "07/01/2014"
    And I select "A Ponte do Rio Que Cai" from "the task hashtag field"
    And I check "the task programming skill field"
    When I press "the new task submit button"
    Then I should be in "the created task page"
    And the user should receive an email

  @ssi
  Scenario: when there is no match between the task and any user
    Given I'm logged in as admin
    And I click in "the new task button"
    And I fill in "the task title field" with "My new task"
    And I fill in "the task description field" with "My new task description"
    And I select "Organizar coletiva de imprensa" from "the task type field"
    And I fill in "the task points field" with "20"
    And I fill in "the task call to action field" with "Go!"
    And I fill in "the task max deliveries field" with "5"
    And I fill in "the task deadline field" with "07/01/2014"
    And I select "A Ponte do Rio Que Cai" from "the task hashtag field"
    And I check "the task programming skill field"
    When I press "the new task submit button"
    Then I should be in "the created task page"
    And I should receive an email

  Scenario: when I'm not logged in
    When I'm in "the homepage"
    Then I should not see "the new task button"
