FactoryGirl.define do
  factory :recipe_step do
    recipe
    text { Faker::Lorem.paragraph }
    sequence(:position) { |n| n }
  end
end
