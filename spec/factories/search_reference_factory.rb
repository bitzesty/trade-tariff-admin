FactoryGirl.define do
  sequence(:search_reference_id) { |n| n }
  sequence(:search_reference_title) { |n| "title #{n}" }
  sequence(:search_reference_section_id) { |n| n }
  sequence(:search_reference_chapter_id) { |n| n }
  sequence(:search_reference_heading_id) { |n| n }

  factory :search_reference do
    id    { generate(:search_reference_id) }
    title { generate(:search_reference_title) }
  end

  factory :section_search_reference, parent: :search_reference, class: Section::SearchReference do
    referenced_entity { build(:section) }
    section_id { referenced_entity.id }
    reference_class { 'Section' }
  end

  factory :chapter_search_reference, parent: :search_reference, class: Chapter::SearchReference do
    reference_class { 'Chapter' }
    referenced_entity { build(:chapter) }
    chapter_id { referenced_entity[:id] }
  end

  factory :heading_search_reference, parent: :search_reference, class: Heading::SearchReference do
    reference_class { 'Heading' }
    referenced_entity { build(:heading) }
    heading_id { referenced_entity[:id] }
  end
end
