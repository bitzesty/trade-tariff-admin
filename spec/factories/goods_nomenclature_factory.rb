FactoryGirl.define do
  sequence(:goods_nomenclature_sid) { |n| n}

  factory :goods_nomenclature do
    goods_nomenclature_sid { generate(:goods_nomenclature_sid) }
    # do not allow zeroes in the goods item id as it causes unpredictable
    # results
    goods_nomenclature_item_id { 10.times.map{ Random.rand(9) + 1 }.join }
    producline_suffix   { [10,20,80].sample }
    validity_start_date { Date.today.ago(2.years) }
    validity_end_date   { nil }

  end

  factory :chapter, parent: :goods_nomenclature, class: Chapter do
    goods_nomenclature_item_id { "#{2.times.map{ Random.rand(9) }.join}00000000" }
  end
end
