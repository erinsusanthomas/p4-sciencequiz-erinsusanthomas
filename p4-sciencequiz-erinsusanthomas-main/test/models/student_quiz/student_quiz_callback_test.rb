require "test_helper"

class StudentQuizCallbackTest < ActiveSupport::TestCase
  # Context
  context "Given context" do
    setup do 
      create_organizations
      create_users
      create_students
      create_events
      create_quizzes
      create_teams
      create_student_teams
      create_team_quizzes
      create_student_quizzes
    end

    should "calculate score when a new student_quiz is added or an existing one is updated" do
      @studentquiz_test = FactoryBot.create(:student_quiz, quiz: @millvale_e1_j3_r1, student: @amelia, num_attempted: 5, num_correct: 3)
      assert_equal 50, @studentquiz_test.score
      @studentquiz_test.num_attempted = 4
      @studentquiz_test.num_correct = 4
      @studentquiz_test.save!
      assert_equal 90, @studentquiz_test.score
      @studentquiz_test.destroy
    end

  end

end
