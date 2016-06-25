FactoryGirl.define do
  factory :recipe do
    sequence(:title) { |n| "Recipe ##{n}" }
    description { Faker::Lorem.paragraph }

    trait(:with_components) do
      after(:create) do |recipe|
        recipe.components = build_list(:component, 3, recipe: recipe)
      end
    end

    trait :vegeterian do
      after(:create) do |recipe|
        recipe.components = build_list(:component, 3, :vegeterian, recipe: recipe)
      end
    end

    trait :non_vegeterian do
      with_components
    end
  end
end
