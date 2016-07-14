FactoryGirl.define do
  factory :recipe_step do
    text { Faker::Lorem.paragraph }
    sequence(:position) { |n| n }
  end
end
