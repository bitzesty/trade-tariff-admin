FactoryGirl.define do
  factory :user do
    sequence(:uid) { |n| n }
    email          { "user#{uid}@example.com" }
    name           { "User#{uid}" }

    trait :gds_editor do
      permissions { [User::Permissions::GDS_EDITOR] }
    end
  end
end
