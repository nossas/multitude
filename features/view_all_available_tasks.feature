Feature: view all available tasks

  Scenario: when there is no available task
    Given there is a full task
    When I go to "the homepage"
    Then I should see "a warning saying that there is no available task"
