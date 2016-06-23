FactoryGirl.define do
  factory :question do
    sequence(:title) { |n| "Question ##{n}" }
    answer { "#{Faker::Hipster.paragraph}\n #{Faker::Hipster.paragraph}" }
  end
end
