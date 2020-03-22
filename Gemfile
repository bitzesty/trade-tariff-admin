source "https://rubygems.org"

ruby '~> 2.6.5'
gem 'rake', '~> 12.3.3'

# Server
gem "puma", "~> 4.3.3"
gem "rails", "6.0.2.2"
gem "sinatra", "~> 2.0.2", require: nil

# DB
gem "pg", "~> 1.1.3"

# Assets
gem "sass-rails"
gem "coffee-rails", "~> 5.0"
gem "uglifier", "~> 2.7"
gem "jquery-rails", "~> 4.3.1"
gem "bootstrap-datepicker-rails", "~> 1.4"
gem "bootstrap-sass", ">= 3.4.1"
gem 'govuk_admin_template', '6.7.0'

# Markdown
gem "govspeak"
gem "addressable", "~> 2.3"

# API
gem "her", "1.1.0"
gem "faraday_middleware"
gem "oj"

# Cache
gem 'redis-activesupport'
gem "redis", "~> 4.0"

# Authorization / SSO
gem "pundit", "0.3.0"
gem "gds-sso", "~> 13.2"
gem "plek", "~> 2.1.0"

# Helpers
gem "kaminari", "~> 1.0"
gem "simple_form", ">= 5.0.0"
gem "responders"

# File upload / mime type
gem "shrine", "~> 3.0"
gem "marcel"

# Logging
gem "logstash-event"
gem "lograge"

# Background jobs
gem "sidekiq", '< 6'
gem "sidekiq-scheduler", "~> 2.2.2"

# Misc
gem "nokogiri", ">= 1.10.9"
gem "bootsnap", require: false

group :development, :test do
  gem "dotenv-rails"
  gem "pry-rails"
  gem "brakeman", "~> 3.3", ">= 3.3.0", require: false
end

group :development do
  gem "govuk-lint", "~> 3.10.0"
end

group :test do
  gem "ci_reporter"
  gem "ci_reporter_rspec"
  gem "factory_girl_rails", "~> 4.8.0"
  gem "shoulda-matchers", "~> 3.1.1"
  gem "simplecov", "~> 0.15.0", require: false
  gem 'rspec-rails', '~> 3.5.2'
  gem "capybara", "~> 2.8"
  gem "webmock", "~> 3.0.1"
  gem "database_cleaner", "~> 1.6"
  gem "rspec_junit_formatter"
end

group :production do
  gem "rails_12factor"
  gem "sentry-raven"
end
