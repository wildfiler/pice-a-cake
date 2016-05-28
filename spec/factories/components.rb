FactoryGirl.define do
  factory :component do
    receipt
    ingredient
    quantity 10
    units 'kg'

    trait :vegeterian do
      after(:build) { |component| component.ingredient.update(vegeterian: true) }
    end
  end
end
