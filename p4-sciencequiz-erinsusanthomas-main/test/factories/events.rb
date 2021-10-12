FactoryBot.define do
  factory :event do
    date { "2021-04-09" }
    association :organization
    active { true }
  end
end
