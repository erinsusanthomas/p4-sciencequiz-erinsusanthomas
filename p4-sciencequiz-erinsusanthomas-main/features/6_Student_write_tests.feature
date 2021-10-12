Feature: Write students
  As an administrator
  I want to be able to create and edit students
  So that I can make adjustments to the student record as needed

  Background:
    Given an initial setup
  
  # CREATE METHODS
  Scenario: Creating a new student is successful
    When I go to the new student page
    And I fill in "student_first_name" with "Ed"
    And I fill in "student_last_name" with "Gruberman"
    And I fill in "student_grade" with "6"
    And I select "Millvale Alliance" from "student_organization_id"
    And I press "Create Student"
    Then I should see "Successfully created Ed Gruberman."
    And I should see "Ed Gruberman"
    And I should see "Millvale Alliance"
    And I should see "Active?"
    And I should see "Yes"
    And I should not see "Team History"
    And I should not see "Starting"
    And I should not see "Ending"

  Scenario: Creating an invalid student fails
    When I go to the new organization page
    When I go to the new student page
    And I fill in "student_first_name" with "Ed"
    # And I fill in "student_last_name" with "Gruberman"
    And I fill in "student_grade" with "6"
    And I select "Millvale Alliance" from "student_organization_id"
    And I press "Create Student"
    Then I should not see "Successfully created Ed Gruberman"
    Then I should see "can't be blank"
    And I should see "New Student"

  # UPDATE METHODS
  Scenario: Editing an existing student is successful
    When I go to edit Jacob Graham's record
    Then I should see "Edit Student"
    And I fill in "student_grade" with "4"
    And I press "Update Student"
    Then I should see "Updated all information on Jacob Graham"
    And I should see "Grade"
    And I should see "4"
