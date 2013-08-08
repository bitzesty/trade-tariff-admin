FactoryGirl.define do
  sequence(:section_note_id) { |n| n }

  factory :section_note do
    id         { generate(:section_note_id) }
    section_id { generate(:section_id) }
    content    { "Content of note" }
  end
end
