FactoryGirl.define do
  factory :commodity do
    goods_nomenclature_item_id { 10.times.map{ Random.rand(9) + 1 }.join }

    trait :with_heading do
      association :heading, strategy: :build

      heading_id { heading.to_param }
    end
  end
end
