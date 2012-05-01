Feature: Resetting the current authors
  Scenario: resetting the current git authors
    Given I have added the author "Linus Torvalds <linus@example.org>"
    And my global Git configuration is setup with user "Global User"
    And I switch to the pair "LT"
    When I reset the current authors
    Then `git pair` should display "Global User" for the current author

  Scenario: Restarting ssh-agent
    Given I have admin access to the box
    And ssh-agent is loaded via launchctl
    And I switch to any pair
    When I reset ssh-agent so that new keys are required
    Then `git pair` should reset ssh-agent
