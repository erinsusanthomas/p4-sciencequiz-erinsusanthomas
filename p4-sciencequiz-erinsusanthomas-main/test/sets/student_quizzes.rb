module Contexts
    module StudentQuizzes
  
      def create_student_quizzes
        @studentquiz_1 = FactoryBot.create(:student_quiz, quiz: @acac_e1_s1_r1, student: @ellie)
        @studentquiz_2 = FactoryBot.create(:student_quiz, quiz: @millvale_e1_j3_r1, student: @mason, num_attempted: 4, num_correct: 4)
        @studentquiz_3 = FactoryBot.create(:student_quiz, quiz: @acac_e1_s1_r1, student: @anna, num_attempted: 3, num_correct: 3)
      end
      
      def destroy_student_quizzes
        @studentquiz_1.destroy
        @studentquiz_2.destroy
        @studentquiz_3.destroy
      end
  
    end
  end