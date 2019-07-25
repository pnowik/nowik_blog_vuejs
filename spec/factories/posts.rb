FactoryBot.define do

  factory :post do
    id { 1 }
    title { 'a' * 7 }
    subtitle { 'a' * 50 }
    body { 'a' * 300 }
    user_id { 1 }
  end
end