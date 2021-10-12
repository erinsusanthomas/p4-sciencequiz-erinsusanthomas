Feature: Read teams -- basic
  As an administrator
  I want to be able to read team data
  So I access to key team information

  Background:
    Given an initial setup
  
  # READ METHODS

  Scenario: No teams yet
    Given no teams yet
    When I go to the teams page
    Then I should see "No active senior teams at this time"
    And I should see "No active junior teams at this time"
    And I should not see "Members"
    And I should not see "Edit"
    And I should not see "true"
    And I should not see "True"
    And I should not see "ID"
    And I should not see "_id"
    And I should not see "Created"
    And I should not see "created"

  Scenario: View all teams
    When I go to the teams page
    Then I should see "Active Senior Teams in ScienceQuiz"
    And I should see "Active Junior Teams in ScienceQuiz"
    And I should see "Organization"
    And I should see "Members"
    And I should see "Edit"
    And I should see "ACAC 1"
    And I should see "ACAC 2"
    And I should see "Millvale 1"
    And I should not see "Show"
    And I should not see "Destroy"
    And I should not see "true"
    And I should not see "True"
    And I should not see "ID"
    And I should not see "_id"
    And I should not see "Created"
    And I should not see "created"

  
  Scenario: The team name is a link to details
    When I go to the teams page
    And I click on the link "Millvale 1"
    Then I should see "Current Students"


  Scenario: View unit details
    When I go to the ACAC Junior 2 details page
    Then I should see "ACAC 2"
    And I should see "Division"
    And I should see "Junior"
    And I should see "Organization"
    And I should see "Allegheny Center Alliance"
    And I should see "Active?"
    And I should see "Current Students"
    And I should see "Name"
    And I should see "Position"
    And I should see "Noah Wicks"
    And I should see "1"
    And I should see "Nathan Jones"
    And I should see "2"
    And I should not see "Caleb Spahr"
    And I should not see "true"
    And I should not see "True"

  Scenario: The student name in current students is a link to details
    When I go to the ACAC Junior 2 details page
    And I click on the link "Jacob Graham"
    Then I should see "Team History"
    And I should see "ACAC 1"

  Scenario: The organization name is a link to details
    When I go to the ACAC Junior 2 details page
    And I click on the link "Allegheny Center Alliance"
    Then I should see "250 East Ohio St"
    And I should see "Joined ScienceQuiz in 2020"
