Feature: view all the people that applyied for a task

  @ssi
  Scenario:
    Given there is a task
    And there is an user
    And this user applyied for this task
    And I'm logged in as admin
    When I go to "this task page"
    Then I should see "this user appliance"
