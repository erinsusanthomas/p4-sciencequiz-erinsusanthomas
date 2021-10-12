Feature: Write organizations
  As an administrator
  I want to be able to create and edit organizations
  So that I can make adjustments to the organizational record as needed

  Background:
    Given an initial setup
  
  # CREATE METHODS
  Scenario: Creating a new organization is successful
    When I go to the new organization page
    And I fill in "organization_name" with "Carnegie Mellon University"
    And I fill in "organization_short_name" with "CMU"
    And I fill in "organization_street_1" with "4800 Forbes Avenue"
    And I fill in "organization_street_2" with "Room 3001"
    And I fill in "organization_city" with "Pittsburgh"
    And I select "Pennsylvania" from "organization_state"
    And I fill in "organization_zip" with "15213"
    And I press "Create Organization"
    Then I should see "Successfully created Carnegie Mellon University"
    And I should see "CMU"
    And I should see "Pittsburgh, PA 15213"
    And I should see "Active?   Yes"
    And I should see "Joined ScienceQuiz in 2021"

  Scenario: Creating an invalid investigation fails
    When I go to the new organization page
    And I fill in "organization_name" with "Carnegie Mellon University"
    # And I fill in "organization_short_name" with "CMU"
    And I fill in "organization_street_1" with "4800 Forbes Avenue"
    And I fill in "organization_street_2" with "Room 3001"
    And I fill in "organization_city" with "Pittsburgh"
    And I select "Pennsylvania" from "organization_state"
    And I fill in "organization_zip" with "15213"
    And I press "Create Organization"
    Then I should not see "Successfully created Carnegie Mellon University"
    Then I should see "can't be blank"
    And I should see "New Organization"

  # UPDATE METHODS
  Scenario: Editing an existing organization is successful
    When I go to edit the ACAC organization
    Then I should see "Edit Organization"
    And I fill in "organization_street_1" with "250 East Ohio Street"
    And I fill in "organization_street_2" with "Suite 120"
    And I press "Update Organization"
    Then I should see "Updated all information for ACAC"
    And I should see "Joined ScienceQuiz in 2020"
