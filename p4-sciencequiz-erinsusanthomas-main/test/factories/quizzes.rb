FactoryBot.define do
  factory :quiz do
    association :event
    division { "junior" }
    room { 6 }
    round { 3 }
  end
end
