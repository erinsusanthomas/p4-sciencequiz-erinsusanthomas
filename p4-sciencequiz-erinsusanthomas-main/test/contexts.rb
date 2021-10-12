# require needed files
require './test/sets/students'
require './test/sets/organizations'
require './test/sets/teams'
require './test/sets/student_teams'
require './test/sets/users'
require './test/sets/events'
require './test/sets/quizzes'
require './test/sets/team_quizzes'
require './test/sets/student_quizzes'
require './test/sets/abilities'


module Contexts
  # explicitly include all sets of contexts used for testing
  include Contexts::Students
  include Contexts::Organizations
  include Contexts::Teams
  include Contexts::StudentTeams
  include Contexts::Users
  include Contexts::Events
  include Contexts::Quizzes
  include Contexts::TeamQuizzes
  include Contexts::StudentQuizzes
  include Contexts::Abilities

  
  def create_all
    puts "Building context..."
    create_organizations
    create_users
    create_events
    create_quizzes
    create_teams
    create_students
    create_student_teams
    create_team_quizzes
    create_student_quizzes
    
    puts "Context built"
  end
  
end
