FactoryGirl.define do
  factory :receipt do
    sequence(:title) { |n| "Receipt ##{n}" }
    description { Faker::Lorem.paragraph }

    trait(:with_components) do
      after(:create) do |receipt|
        receipt.components = build_list(:component, 3, receipt: receipt)
      end
    end

    trait :vegeterian do
      after(:create) do |receipt|
        receipt.components = build_list(:component, 3, :vegeterian, receipt: receipt)
      end
    end

    trait :non_vegeterian do
      with_components
    end
  end
end
