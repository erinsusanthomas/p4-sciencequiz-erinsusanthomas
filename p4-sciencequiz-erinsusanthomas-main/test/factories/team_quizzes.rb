FactoryBot.define do
  factory :team_quiz do
    association :team
    association :quiz
    raw_score { 150 }
    team_points { 15 }
    position { 2 }
  end
end
