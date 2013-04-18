FactoryGirl.define do
  factory :section_note do
    section
    content { "Content of note" }
  end
end
