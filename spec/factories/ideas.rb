FactoryBot.define do
  factory :idea do
    sequence(:body) { |n| "テストbody#{n}" }
    association :category
  end
end
