FactoryBot.define do

  factory :user do
    sequence(:email) { |n| "test#{n}@example.com" }
    sequence(:name) { |n|  "testuser#{n}" }
    password { "password" }
    password_confirmation { "password" }
    trait :standard do
      role { 'standard' }
    end
    trait :mod do
      role { 'mod' }
    end
    trait :admin do
      role { 'admin' }
    end
  end

end