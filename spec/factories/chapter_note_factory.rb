FactoryGirl.define do
  factory :chapter_note do
    section
    chapter
    content { "Content of note" }
  end
end
