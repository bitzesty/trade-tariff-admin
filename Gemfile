source "https://rubygems.org"

ruby '~> 2.7.1'

# Server
gem "puma", "~> 5.0.0.beta2"
gem "rails", ">= 6.0.3.3"
gem "sinatra", "~> 2.0.8", require: nil

# DB
gem "pg", "~> 1.1.3"

# Assets
gem "sass-rails"
gem "coffee-rails", "~> 5.0"
gem "uglifier", "~> 2.7"
gem "jquery-rails", "~> 4.3.4"
gem "bootstrap-datepicker-rails", "~> 1.4"
gem "bootstrap-sass", ">= 3.4.1"
gem 'govuk_admin_template', '6.7.0'

# Markdown
gem "govspeak", "6.5.6"
gem "govuk_publishing_components", "21.5.0"
gem "addressable", "~> 2.7"

# API
gem "her", "1.1.0"
gem "faraday_middleware"
gem "oj"

# Cache
gem 'redis-activesupport'
gem "redis", "~> 4.2"

# Authorization / SSO
gem "pundit", "0.3.0"
gem "gds-sso", "~> 15"
gem "plek", "~> 2.1.0"

# Helpers
gem "kaminari", "~> 1.2"
gem "simple_form", ">= 5.0.0"
gem "responders"

# File upload / mime type
gem "shrine", "~> 3.0"
gem "marcel"

# Logging
gem "logstash-event"
gem "lograge"

# Background jobs
gem "sidekiq", '< 7'
gem "sidekiq-scheduler", "~> 3.0"

# Misc
gem "nokogiri", ">= 1.10.10"
gem "bootsnap", require: false

group :development, :test do
  gem "dotenv-rails"
  gem "pry-rails"
  gem "brakeman", "~> 3.3", ">= 3.3.0", require: false
end

group :development do
  gem "rubocop-govuk"
end

group :test do
  gem "ci_reporter"
  gem "ci_reporter_rspec"
  gem "factory_bot_rails"
  gem "shoulda-matchers", "~> 3.1.1"
  gem "simplecov", "~> 0.18", require: false
  gem 'rspec-rails', '~> 4'
  gem "capybara", "~> 3"
  gem "webmock", "~> 3.8.0"
  gem "database_cleaner", "~> 1.8"
  gem "rspec_junit_formatter"
end

group :production do
  gem "sentry-raven"
end
