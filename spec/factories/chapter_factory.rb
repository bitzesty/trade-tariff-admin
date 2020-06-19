FactoryBot.define do
  sequence(:chapter_description) { |n| "description #{n}" }
  sequence(:sid) { |n| n }

  factory :chapter do
    goods_nomenclature_item_id { 10.times.map { Random.rand(1..9) }.join }
    goods_nomenclature_sid { generate(:sid) }
    description { generate(:chapter_description) }

    trait :with_note do
      chapter_note_id { generate(:chapter_note_id) }
    end

    trait :with_section do
      association :section, strategy: :build

      section_id { section.id }
    end
  end
end
