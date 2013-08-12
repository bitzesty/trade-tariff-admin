FactoryGirl.define do
  to_create {|instance| instance.save }

  sequence(:uid) { |n| n }

  factory :user do
    email { "user#{uid}@example.com" }
    name  { "User#{uid}" }

    trait :gds_editor do
      permissions { [User::Permissions::GDS_EDITOR] }
    end
  end
end
