Feature: Write students
  As an administrator
  I want to be able to create and edit teams
  So that I can make adjustments to the team record as needed

  Background:
    Given an initial setup
  
  # CREATE METHODS
  Scenario: Creating a new team is successful
    When I go to the new team page
    And I fill in "team_name" with "Millvale 2"
    And I select "Millvale Alliance" from "team_organization_id"
    And I select "Junior" from "team_division"
    And I press "Create Team"
    Then I should see "Successfully created Millvale 2 team."
    And I should see "Active?"
    And I should see "Yes"
    And I should not see "Current Students"
    And I should not see "Name"
    And I should not see "Position"

  Scenario: Creating an invalid team fails
    When I go to the new team page
    # And I fill in "team_name" with "Millvale 2"
    And I select "Millvale Alliance" from "team_organization_id"
    And I select "Junior" from "team_division"
    And I press "Create Team"
    Then I should not see "Successfully created Millvale 2 team."
    Then I should see "can't be blank"
    And I should see "New Team"

  # UPDATE METHODS
  Scenario: Editing an existing team is successful
    When I go to edit the ACAC Junior 2 page
    Then I should see "Edit Team"
    And I fill in "team_name" with "ACAC All-Stars"
    And I press "Update Team"
    Then I should see "Updated all information for ACAC All-Stars"

