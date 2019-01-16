FactoryGirl.define do
  sequence(:search_reference_id) { |n| n }
  sequence(:search_reference_title) { |n| "title #{n}" }

  factory :search_reference do
    id    { generate(:search_reference_id) }
    title { generate(:search_reference_title) }
  end

  factory :section_search_reference, parent: :search_reference, class: Section::SearchReference do
    transient do
      referenced { attributes_for(:section) }
    end
    referenced_class { 'Section' }
    referenced_id { referenced[:id] }
  end

  factory :chapter_search_reference, parent: :search_reference, class: Chapter::SearchReference do
    transient do
      referenced { attributes_for(:chapter) }
    end
    referenced_class { 'Chapter' }
    referenced_id { referenced[:goods_nomenclature_item_id].first(2) }
  end

  factory :heading_search_reference, parent: :search_reference, class: Heading::SearchReference do
    transient do
      referenced { attributes_for(:heading) }
    end
    referenced_class { 'Heading' }
    referenced_id { referenced[:goods_nomenclature_item_id].first(4) }
  end

  factory :commodity_search_reference, parent: :search_reference, class: Commodity::SearchReference do
    transient do
      referenced { attributes_for(:commodity) }
    end
    referenced_class { 'Commodity' }
    referenced_id { referenced[:goods_nomenclature_item_id] }
  end
end
