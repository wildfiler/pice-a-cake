FactoryGirl.define do
  factory :ingredient_attitude do
    user
    ingredient
    attitude 'love'

    trait :love do
      attitude 'love'
    end

    trait :hate do
      attitude 'hate'
    end
  end
end
