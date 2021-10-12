FactoryBot.define do
  factory :student_quiz do
    association :student
    association :quiz
    score {  }
    num_attempted { 6 }
    num_correct { 4 }
  end
end
