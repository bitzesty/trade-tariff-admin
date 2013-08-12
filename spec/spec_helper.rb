ENV["RAILS_ENV"] ||= 'test'

require 'simplecov'
require 'simplecov-rcov'

SimpleCov.start 'rails'
SimpleCov.formatter = SimpleCov::Formatter::RcovFormatter

require File.expand_path("../../config/environment", __FILE__)

require 'rspec/rails'
require 'rspec/autorun'
require 'gds_api/test_helpers/content_api'
require 'pundit/rspec'

Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.order = :random
  config.infer_base_class_for_anonymous_controllers = false
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
  config.treat_symbols_as_metadata_keys_with_true_values = true

  config.include ApiResponsesHelper
  config.include FactoryGirl::Syntax::Methods
  config.include FeaturesHelper, type: :feature
  config.include GdsApi::TestHelpers::ContentApi

  config.before(type: :request) do
    stub_content_api_default_artefact
  end

  config.before(:suite) do
    Sequel::Model.db.tables.delete_if{|t| t == :schema_migrations }
                           .each{|table| Sequel::Model.db.from(table).truncate}
  end

  config.around(:each) do |example|
    Sequel::Model.db.transaction(rollback: :always){example.run}
  end
end
