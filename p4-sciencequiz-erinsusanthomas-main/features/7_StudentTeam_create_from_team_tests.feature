Feature: Add Assignment from Team 
  As an administrator
  I want to be able to make an assignment from teams#show
  So I can add new quizzers to teams lacking students

  Background:
    Given an initial setup
  
  # CREATE METHODS
  Scenario: Can add an assignment from team details page
    When I go to the ACAC Junior 1 details page
    And I click on the link "Add a new student"
    Then I should see "Current Students on ACAC 1"
    And I should see "Caleb Spahr"
    And I should see "New Assignment for ACAC 1"
    When I select "Jones, Nathan" from "student_team_student_id"
    And I select "1" from "student_team_position"
    And I press "Create Student team"
    Then I should see "Nathan Jones"
    And I should see "Current Students"
    And I should see "Successfully added the student team assignment"
