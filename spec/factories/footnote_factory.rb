FactoryGirl.define do
  sequence(:footnote_id) { |n| "%03d" % n }
  sequence(:footnote_type_id) { |n| "%02d" % n }
  sequence(:footnote_description) { |n| "footnote description #{n}" }

  factory :footnote do
    id { "#{footnote_type_id}#{footnote_id}" }
    footnote_id { generate(:footnote_id) }
    footnote_type_id { generate(:footnote_type_id) }
    description { generate(:footnote_description) }
    validity_start_date { Time.now.ago(3.years).to_s }
  end
end
