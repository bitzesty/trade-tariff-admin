FactoryGirl.define do
  sequence(:search_reference_id) { |n| n }
  sequence(:search_reference_title) { |n| "title #{n}" }

  factory :search_reference do
    id    { generate(:search_reference_id) }
    title { generate(:search_reference_title) }
  end

  factory :section_search_reference, parent: :search_reference, class: Section::SearchReference do
    referenced { attributes_for(:section) }
    referenced_id { referenced[:id] }
    referenced_class { 'Section' }
  end

  factory :chapter_search_reference, parent: :search_reference, class: Chapter::SearchReference do
    referenced_class { 'Chapter' }
    referenced { attributes_for(:chapter) }
    referenced_id { referenced[:goods_nomenclature_item_id].first(2) }
  end

  factory :heading_search_reference, parent: :search_reference, class: Heading::SearchReference do
    referenced_class { 'Heading' }
    referenced { attributes_for(:heading) }
    referenced_id { referenced[:goods_nomenclature_item_id].first(4) }
  end

  factory :commodity_search_reference, parent: :search_reference, class: Commodity::SearchReference do
    referenced_class { 'Commodity' }
    referenced { attributes_for(:commodity) }
    referenced_id { referenced[:goods_nomenclature_item_id] }
  end
end
