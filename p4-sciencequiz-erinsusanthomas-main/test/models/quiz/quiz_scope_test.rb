require "test_helper"

class QuizScopeTest < ActiveSupport::TestCase

  # Context
  context "Given context for quiz" do
    setup do 
      create_organizations
      create_events
      create_quizzes
    end

    teardown do
      destroy_quizzes
      destroy_events
      destroy_organizations
    end

    should "list quizzes by room" do
      assert_equal [@acac_e1_s1_r1, @acac_e3_s1_r2, @acac_e1_s2_r2, 
                    @acac_e3_s2_r1, @millvale_e1_j3_r1, @millvale_e1_j4_r2], Quiz.by_room
    end

    should "list quizzes by round" do
      assert_equal [@acac_e1_s1_r1, @acac_e3_s2_r1, @millvale_e1_j3_r1, 
                    @acac_e1_s2_r2, @acac_e3_s1_r2, @millvale_e1_j4_r2], Quiz.by_round
    end

    should "list quizzes for room" do
      assert_equal [@acac_e1_s2_r2, @acac_e3_s2_r1], Quiz.for_room(2)
      assert_equal [@millvale_e1_j3_r1], Quiz.for_room(3)
      assert_equal [], Quiz.for_room(5)
    end

    should "list quizzes for round" do
      assert_equal [@acac_e1_s1_r1, @acac_e3_s2_r1, @millvale_e1_j3_r1], Quiz.for_round(1)
      assert_equal [@acac_e1_s2_r2, @acac_e3_s1_r2, @millvale_e1_j4_r2], Quiz.for_round(2)
      assert_equal [], Quiz.for_round(3)
    end

    should "list quizzes of senior division" do
      assert_equal [@acac_e1_s1_r1, @acac_e1_s2_r2, @acac_e3_s1_r2, @acac_e3_s2_r1], Quiz.seniors
    end
  
    should "list quizzes of junior division" do
      assert_equal [@millvale_e1_j3_r1, @millvale_e1_j4_r2], Quiz.juniors
    end

    should "list quizzes for event" do
      assert_equal [@acac_e1_s1_r1, @acac_e1_s2_r2], Quiz.for_event(@acac_e1) 
      assert_equal [], Quiz.for_event(@acac_e2)
      assert_equal [@acac_e3_s1_r2, @acac_e3_s2_r1], Quiz.for_event(@acac_e3)
      assert_equal [@millvale_e1_j3_r1, @millvale_e1_j4_r2], Quiz.for_event(@millvale_e1)
    end

  end

end