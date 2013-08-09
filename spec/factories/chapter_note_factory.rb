FactoryGirl.define do
  sequence(:chapter_note_id) { |n| n }

  factory :chapter_note do
    content { "Content of note" }

    trait :persisted do
      id      { generate(:chapter_note_id) }
    end
  end
end
