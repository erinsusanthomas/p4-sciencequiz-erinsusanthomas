require './test/contexts'
include Contexts

Given /^an initial setup$/ do
  create_all
  create_more_students
  create_more_teams
  create_more_student_teams
end

Given /^no setup yet$/ do
  # assumes initial setup already run as background
  destroy_more_student_teams
  destroy_student_teams
  destroy_more_students
  destroy_students
  destroy_more_teams
  destroy_teams
  destroy_organizations
end

Given /^no organizations yet$/ do
  # assumes initial setup already run as background
  destroy_organizations
end

Given /^no teams yet$/ do
  # assumes initial setup already run as background
  destroy_teams
  destroy_more_teams
end

Given /^no students yet$/ do
  # assumes initial setup already run as background
  destroy_students
  destroy_more_students
end

