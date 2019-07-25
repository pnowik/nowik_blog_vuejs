FactoryBot.define do

  factory :comment do
    body { 'a' * 30 }
    post_id { 1 }
    user_id { 1 }
  end

end
