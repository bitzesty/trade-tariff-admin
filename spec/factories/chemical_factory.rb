FactoryBot.define do
  factory :chemical do
    sequence(:cas) { |n| "0-#{n}-0" }
    sequence(:id) { |n| "#{n}" }
    sequence(:name) { |n| "chemical-#{n}" }
    goods_nomenclature_map { {} }
  end
end