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

    trait :with_exception do
      exception_class "ChiefImporter::ImportException"
      exception_queries "(Sequel::Mysql2::Database) BEGIN \n(Sequel::Mysql2::Database) SELECT * FROM `measures` LIMIT 1 \n(Sequel::Mysql2::Database) ROLLBACK \n(Sequel::Mysql2::Database) UPDATE `tariff_updates` SET `state` = 'F', `updated_at` = '2014-07-22 16:16:15' WHERE ((`tariff_updates`.`update_type` IN ('TariffSynchronizer::TaricUpdate')) AND (`filename` = '2014-07-22_TGB14203.xml')) LIMIT 1 "
      exception_backtrace "/var/govuk/trade-tariff-backend/spec/unit/tariff_synchronizer/logger_spec.rb:179:in `block (4 levels) in <top (required)>'\n/usr/lib/rbenv/versions/2.0.0-p353/lib/ruby/gems/2.0.0/gems/rspec-mocks-2.14.1/lib/rspec/mocks/message_expectation.rb:519:in `call'\n/usr/lib/rbenv/versions/2.0.0-p353/lib/ruby/gems/2.0.0/gems/rspec-mocks-2.14.1/lib/rspec/mocks/message_expectation.rb:519:in `block in call'\n/usr/lib/rbenv/versions/2.0.0-p353/lib/ruby/gems/2.0.0/gems/rspec-mocks-2.14.1/lib/rspec/mocks/message_expectation.rb:518:in `map'\n/usr/lib/rbenv/versions/2.0.0-p353/lib/ruby/gems/2.0.0/gems/rspec-mocks-2.14.1/lib/rspec/mocks/message_expectation.rb:518:in `call'\n/usr/lib/rbenv/versions/2.0.0-p353/lib/ruby/gems/2.0.0/gems/rspec-mocks-2.14.1/lib/rspec/mocks/message_expectation.rb:186:in `invoke'\n/usr/lib/rbenv/versions/2.0.0-p353/lib/ruby/gems/2.0.0/gems/rspec-mocks-2.14.1/lib/rspec/mocks/proxy.rb:144:in `message_received'\n/usr/lib/rbenv/versions/2.0.0-p353/lib/ruby/gems/2.0.0/gems/rspec-mocks-2.14.1/lib/rspec/mocks/method_double.rb:174:in `import'\n/usr/lib/rbenv/versions/2.0.0-p353/lib/ruby/gems/2.0.0/gems/rspec-mocks-2.14.1/lib/rspec/mocks/any_instance/recorder.rb:187:in `import'"
    end

    trait :missing do
      state { 'M' }
    end
  end
end
