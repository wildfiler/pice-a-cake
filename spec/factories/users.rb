FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password '12345678'
    role 'user'

    trait :admin do
      role 'admin'
    end

    trait :moderator do
      role 'moderator'
    end
  end
end
