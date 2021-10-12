Feature: Read organizations -- basic
  As an administrator
  I want to be able to read organization data
  So I access to key organization information

  
  # READ METHODS

  Scenario: No organizations yet
    When I go to the organizations page
    And I should see "No active organizations at this time"
    And I should not see "Name"
    And I should not see "State"
    And I should not see "true"
    And I should not see "True"
    And I should not see "ID"
    And I should not see "_id"
    And I should not see "Created"
    And I should not see "created"

  Scenario: View all organizations
    Given an initial setup
    When I go to the organizations page
    Then I should see "Active Organizations"
    And I should see "Name"
    And I should see "State"
    And I should see "Edit"
    And I should see "Allegheny Center Alliance"
    And I should see "Millvale Alliance"
    And I should see "ScienceQuiz"
    And I should see "Inactive Organizations"
    And I should see "Cinderlands Alliance"
    And I should not see "Show"
    And I should not see "Destroy"
    And I should not see "true"
    And I should not see "True"
    And I should not see "ID"
    And I should not see "_id"
    And I should not see "Created"
    And I should not see "created"

  
  Scenario: The organization name is a link to details
    Given an initial setup
    When I go to the organizations page
    And I click on the link "Uniontown Alliance"
    Then I should not see "Current Teams"


  Scenario: View organization details for ACAC
    Given an initial setup
    When I go to the details for ACAC page
    Then I should see "Allegheny Center Alliance"
    And I should see "ACAC"
    And I should see "250 East Ohio St"
    And I should see "Pittsburgh, PA 15212"
    And I should see "Active?   Yes"
    And I should see "Joined ScienceQuiz in 2020"
    And I should see "Current Teams - ACAC"
    And I should see "ACAC 1"
    And I should see "Junior"
    And I should not see "ACAC 4"
    And I should not see "Millvale 1"
    And I should see "Add a new team"
    And I should see "Current Students - ACAC"
    And I should see "Bailey, Lydia"
    And I should see "10"
    And I should see "Add a new student"
    And I should not see "Heimann, Rachel"
    And I should not see "Nelson, MJ"
    And I should not see "true"
    And I should not see "True"

  Scenario: View organization details for Millvale
    Given an initial setup
    When I go to the details for Millvale page
    Then I should see "Millvale Alliance"
    And I should see "10 Sherman St"
    And I should see "Pittsburgh, PA 15209"
    And I should see "Active?   Yes"
    And I should see "Joined ScienceQuiz in 2021"
    And I should see "Current Teams - Millvale"
    And I should see "Millvale 1"
    And I should see "Junior"
    And I should not see "ACAC 1"
    And I should see "Add a new team"
    And I should see "Current Students - Millvale"
    And I should see "Nelson, MJ"
    And I should see "5"
    And I should see "Add a new student"
    And I should not see "true"
    And I should not see "True"

  Scenario: The student name is a link to details
    Given an initial setup
    When I go to the details for ACAC page
    And I click on the link "Bailey, Lydia"
    Then I should see "Lydia Bailey"
    And I should see "Current Team"

  Scenario: The team name is a link to details
    Given an initial setup
    When I go to the details for Millvale page
    And I click on the link "Millvale 1"
    Then I should see "Current Students"
    And I should see "MJ Nelson"