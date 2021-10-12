require "test_helper"

class StudentQuizScopeTest < ActiveSupport::TestCase
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

    should "list student_quizzes by student" do
      assert_equal ["Davis, Anna", "Moon, Mason", "Wilshire, Ellie"], StudentQuiz.by_student.map{|sq| sq.student.name}
      assert_equal [@studentquiz_3, @studentquiz_2, @studentquiz_1], StudentQuiz.by_student
    end

    should "list student_quizzes by quiz" do
      assert_equal [@studentquiz_1, @studentquiz_3, @studentquiz_2], StudentQuiz.by_quiz
    end

    should "list student_quizzes by score" do
      assert_equal [90, 70, 60], StudentQuiz.by_score.map{|sq| sq.score}  #expected scores as calculated by callback
      assert_equal [@studentquiz_2, @studentquiz_1, @studentquiz_3], StudentQuiz.by_score
    end

    should "list student_quizzes for a given student" do
      assert_equal [], StudentQuiz.for_student(@mj)
      assert_equal [@studentquiz_1], StudentQuiz.for_student(@ellie)
      assert_equal [@studentquiz_3], StudentQuiz.for_student(@anna)
    end

    should "list student_quizzes for a given quiz" do
      assert_equal [@studentquiz_1, @studentquiz_3], StudentQuiz.for_quiz(@acac_e1_s1_r1)
      assert_equal [], StudentQuiz.for_quiz(@acac_e3_s1_r2)
      assert_equal [@studentquiz_2], StudentQuiz.for_quiz(@millvale_e1_j3_r1)
    end

  end

end
