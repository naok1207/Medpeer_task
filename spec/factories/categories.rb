FactoryBot.define do
  factory :category do
    sequence(:name) { |n| "テストカテゴリ#{n}" }

    trait :with_ideas do
      after(:create) { |category| create_list(:idea, 5, category: category)}
    end
  end
end
