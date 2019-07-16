FactoryGirl.define do

  factory :user do
    sequence(:email) { |n| "test#{n}@example.com" }
    sequence(:name) { |n|  "testuser#{n}" }
    password 'password'
    password_confirmation 'password'
    trait :standard do
      role 'standard'
    end
    trait :mod do
      role 'mod'
    end
    trait :admin do
      role 'admin'
    end
  end

  factory :post do
    id 1
    title 'a' * 7
    subtitle 'a' * 50
    body 'a' * 300
    user_id 1
  end

  factory :comment do
    body 'a' * 30
    post_id 1
    user_id 1
  end

end