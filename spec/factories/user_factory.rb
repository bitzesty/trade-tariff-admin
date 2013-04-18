FactoryGirl.define do
  to_create {|instance| instance.save }

  sequence(:uid) { |n| n }

  factory :user do
    email { "user#{uid}@example.com" }
    name  { "User#{uid}" }
  end
end
