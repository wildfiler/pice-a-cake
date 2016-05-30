FactoryGirl.define do
  factory :ingredient do
    sequence(:name) { |n| "Ingredient ##{n}" }
    vegeterian false
    spice false

    trait :spice do
      spice true
      after(:build) { |ingredient| ingredient.name = "Spice #{ingredient.name}" }
    end

    trait :vegeterian do
      vegeterian true
      after(:build) { |ingredient| ingredient.name = "Vegetarian #{ingredient.name}" }
    end
  end
end
