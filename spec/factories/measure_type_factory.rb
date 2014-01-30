FactoryGirl.define do
  sequence(:measure_type_id) { |n| n }
  sequence(:measure_type_description) { |n| "measure_type description #{n}" }

  factory :measure_type do
    id { generate(:measure_type_id) }
    description { generate(:measure_type_description) }
    validity_start_date { Time.now.ago(3.years).to_s }
  end
end
