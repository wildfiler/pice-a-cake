FactoryGirl.define do
  factory :component do
    recipe
    ingredient
    quantity { rand(100) + 2 }
    units { %w(kg l g glasses spoons barrels gallons bottles pounds).sample }


    trait :vegeterian do
      after(:build) { |component| component.ingredient.update(vegeterian: true) }
    end
  end
end
