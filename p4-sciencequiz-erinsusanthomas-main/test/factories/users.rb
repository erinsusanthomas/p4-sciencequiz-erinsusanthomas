FactoryBot.define do
  factory :user do
    first_name { "Megan" }
    last_name { "Cuda" }
    status { "coach" }
    association :organization
    active { true }
    email { "mcuda@example.com" }
    phone { "411-223-4569" }
    password { "secret" }
    password_confirmation { "secret" }
    username { "mcuda" }
  end
end
