FactoryGirl.define do
  factory :heading do
    goods_nomenclature_item_id { 10.times.map{ Random.rand(9) + 1 }.join }
  end
end
