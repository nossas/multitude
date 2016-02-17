Feature: create a task

  Background:
    Given there is a mobilization called "A Ponte do Rio Que Cai"
    And there is a task type called "Organizar coletiva de imprensa"
    And there is an organization in "Rio de Janeiro"

  Scenario: when I'm not logged in
    When I'm in "the homepage"
    Then I should not see "the new task button"
