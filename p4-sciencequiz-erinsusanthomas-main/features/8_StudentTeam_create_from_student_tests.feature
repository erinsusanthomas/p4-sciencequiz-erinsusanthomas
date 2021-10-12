Feature: Add Assignment from Student 
  As an administrator
  I want to be able to make an assignment from students#show
  So I can add reassign a student to a new team

  Background:
    Given an initial setup
  
  # CREATE METHODS
  Scenario: Can add an assignment from team details page
    When I go to Jacob Graham's details page
    And I click on the link "Add to a new team"
    Then I should see "New Assignment for Jacob Graham"
    And I should see "Currently on ACAC 2"
    When I select "ACAC 1" from "student_team_team_id"
    And I select "1" from "student_team_position"
    And I press "Create Student team"
    Then I should see "Jacob Graham"
    And I should see "Current Students"
    And I should see "Successfully added the student team assignment"