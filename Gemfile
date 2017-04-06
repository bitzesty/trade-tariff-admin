source "https://rubygems.org"
ruby "2.3.3"

gem "rails", "4.2.7.1"
gem "sass-rails", "~> 5.0.6"
gem "coffee-rails", "~> 4.1"
gem "uglifier", "~> 2.7"

gem "pg"
gem "her", "0.6.8"
gem "pundit", "0.3.0"

gem "kaminari", "~> 0.16"
gem "simple_form", "~> 3.1"
gem "govspeak", "~> 3.4"

gem 'govuk_admin_template', '4.1.1'

gem "gds-sso", "~> 12"
gem "plek", "~> 1.11"
gem "addressable", "~> 2.3"

gem "puma", "~> 3.4"

gem "jquery-rails", "~> 3.1.1"
gem "bootstrap-datepicker-rails", "~> 1.4"
gem "responders", "~> 2.1"

gem "logstash-event"
gem "lograge"
gem "dalli", "~> 2.7"
gem "connection_pool", "~> 2.2"

gem "sidekiq", "~> 4.1.1"
gem "sidekiq-scheduler", "~> 2.0"
gem "sinatra", "~> 1.4.7", require: nil
gem "bootscale", "~> 0.5", require: false

group :development, :test do
  gem "pry-rails"
  gem "brakeman", "~> 3.0", require: false
end

group :test do
  gem "ci_reporter"
  gem "ci_reporter_rspec"
  gem "factory_girl_rails"
  gem "shoulda-matchers"
  gem "simplecov"
  gem "simplecov-rcov"
  gem "rspec-rails"
  gem "capybara", "~> 2.4"
  gem "webmock"
  gem "database_cleaner"
  gem "rspec_junit_formatter"
end

group :production do
  gem "therubyracer", "~> 0.12"
  gem "rails_12factor"
  gem "sentry-raven"
  gem "newrelic_rpm"
end
