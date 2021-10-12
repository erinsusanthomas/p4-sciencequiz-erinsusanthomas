module Contexts
    module TeamQuizzes
  
      def create_team_quizzes
        @acac_s1_e1_s1_r1 = FactoryBot.create(:team_quiz, quiz: @acac_e1_s1_r1, team: @acac_s1)
        @acac_s1_e1_s2_r2 = FactoryBot.create(:team_quiz, quiz: @acac_e1_s2_r2, team: @acac_s1, raw_score: 130, team_points: 13, position: 1)
        @acac_s1_e3_s1_r2 = FactoryBot.create(:team_quiz, quiz: @acac_e3_s1_r2, team: @acac_s1, raw_score: 110, team_points: 11, position: 2)
        @acac_s1_e3_s2_r1 =  FactoryBot.create(:team_quiz, quiz: @acac_e3_s2_r1, team: @acac_s1, raw_score: 100, team_points: 10, position: 3)
        @millvale_j1_e1_j3_r1 = FactoryBot.create(:team_quiz, quiz: @millvale_e1_j3_r1, team: @millvale_j1, raw_score: 120, team_points: 12, position: 3)
        @millvale_j1_e1_j4_r2 = FactoryBot.create(:team_quiz, quiz: @millvale_e1_j4_r2, team: @millvale_j1, raw_score: 140, team_points: 14,position: 1) 
      end
      
      def destroy_team_quizzes
        @acac_s1_e1_s1_r1.destroy 
        @acac_s1_e1_s2_r2.destroy 
        @acac_s1_e3_s1_r2.destroy 
        @acac_s1_e3_s2_r1.destroy 
        @millvale_j1_e1_j3_r1.destroy 
        @millvale_j1_e1_j4_r2.destroy
      end
  
    end
  end