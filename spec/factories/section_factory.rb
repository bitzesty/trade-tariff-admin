FactoryGirl.define do
  sequence(:section_id)      { |n| n }

  factory :section do
    id              { generate(:section_id) }
    section_note_id { nil }
    position        { id }
    numeral         { id }
    title           { "Section Title" }

    trait :with_note do
      section_note_id { generate(:section_note_id) }
    end
  end
end
