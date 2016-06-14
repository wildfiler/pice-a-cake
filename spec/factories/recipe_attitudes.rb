FactoryGirl.define do
  factory :recipe_attitude do
    user
    receipt
    attitude 'love'

    trait :love do
      attitude 'love'
    end

    trait :hate do
      attitude 'hate'
    end
  end
end
