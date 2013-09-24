FactoryGirl.define do
  factory :chapter do
    goods_nomenclature_item_id { 10.times.map{ Random.rand(9) + 1 }.join }

    trait :with_note do
      chapter_note_id { generate(:chapter_note_id) }
    end
  end
end
