FactoryGirl.define do
  factory :tariff_update do
    update_type { ['TariffSynchronizer::TaricUpdate', 'TariffSynchronizer::ChiefUpdate'].sample }
    state { ['A', 'M', 'P', 'F'].sample }
    updated_at { Time.now }
    created_at { Time.now }

    trait :chief do
      update_type { 'TariffSynchronizer::ChiefUpdate' }
    end

    trait :taric do
      update_type { 'TariffSynchronizer::TaricUpdate' }
    end

    trait :missing do
      state { 'M' }
    end
  end
end
