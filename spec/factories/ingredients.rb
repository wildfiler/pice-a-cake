FactoryGirl.define do
  factory :ingredient do
    sequence(:name) { |n| "Ingredient ##{n}"}
    vegeterian false
    spice false

    trait :spice do
      sequence(:name) { |n| "Spicy Ingredient ##{n}"}
      spice true
    end
  end
end
