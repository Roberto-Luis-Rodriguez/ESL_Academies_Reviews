FactoryBot.define do
  factory :user do
    sequence(:email) {|n| "person#{n}@example.com" }
    password '1234567'
    password_confirmation '1234567'
  end
end
