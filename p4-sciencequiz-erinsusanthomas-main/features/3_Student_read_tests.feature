Feature: Read students -- basic
  As an administrator
  I want to be able to read student data
  So I access to key student information

  Background:
    Given an initial setup
  
  # READ METHODS

  Scenario: No students yet
    Given no students yet
    When I go to the students page
    And I should see "No active students at this time"
    And I should not see "Student Name"
    And I should not see "Current Team"
    And I should not see "true"
    And I should not see "True"
    And I should not see "ID"
    And I should not see "_id"
    And I should not see "Created"
    And I should not see "created"

  Scenario: View all students
    When I go to the students page
    Then I should see "Active Students in ScienceQuiz"
    And I should see "Student Name"
    And I should see "Organization"
    And I should see "Current Team"
    And I should see "Edit"
    And I should see "Bailey, Lydia"
    And I should see "Allegheny Center Alliance"
    And I should see "ACAC 2"
    And I should see "Coffey, Cana"
    And I should see "Allegheny Center Alliance"
    And I should see "N/A"
    And I should see "Next"
    And I should see "Inactive Students"
    And I should see "Heimann, Rachel"
    And I should not see "Show"
    And I should not see "Destroy"
    And I should not see "true"
    And I should not see "True"
    And I should not see "ID"
    And I should not see "_id"
    And I should not see "Created"
    And I should not see "created"

  
  Scenario: The student name is a link to details
    When I go to the students page
    And I click on the link "Bailey, Lydia"
    Then I should see "Lydia Bailey"
    And I should see "Current Team"


  Scenario: View student details for Jacob Graham
    When I go to Jacob Graham's details
    Then I should see "Jacob Graham"
    And I should see "Allegheny Center Alliance"
    And I should see "Current Team"
    And I should see "ACAC 2"
    And I should see "Grade:"
    And I should see "3"
    And I should see "Active?"
    And I should see "Yes"
    And I should see "Team History"
    And I should see "Team"
    And I should see "ACAC 1"
    And I should see "Starting"
    And I should see "10/09/20"
    And I should see "Ending"
    And I should see "01/15/21"
    And I should see "Team"
    And I should see "ACAC 2"
    And I should see "Starting"
    And I should see "01/15/21"
    And I should see "Ending"
    And I should see "--"
    And I should not see "ACAC 3"
    And I should not see "Millvale 1"
    And I should see "Add to a new team"
    And I should not see "true"
    And I should not see "True"

  Scenario: The team name in team history is a link to details
    When I go to Jacob Graham's details
    And I click on the link "ACAC 1"
    Then I should see "Current Students"
    And I should see "Caleb Spahr"

  Scenario: The organization name is a link to details
    When I go to Jacob Graham's details
    And I click on the link "Allegheny Center Alliance"
    Then I should see "250 East Ohio St"
    And I should see "Joined ScienceQuiz in 2020"