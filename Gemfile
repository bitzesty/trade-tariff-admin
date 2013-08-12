source "https://rubygems.org"
source "https://BnrJb6FZyzspBboNJzYZ@gem.fury.io/govuk/"

gem "rails", "4.0.0"

gem "mysql2"
gem "sequel", "~> 4.0.0"
gem "sequel-rails", "~> 0.5.0"
gem "her"
gem "pundit"

gem "kaminari"
gem "simple_form", github: "plataformatec/simple_form", branch: "master", ref: "87323fd62"

gem "gds-sso", github: "alphagov/gds-sso", branch: "master", ref: "bf4b6d13a1"
gem "gds-api-adapters", "> 4.1.3"
gem "plek", ">= 1.0.0"
gem "addressable"

gem "unicorn", "~> 4.6.3"

gem "lograge", "0.1.2"
gem "aws-ses", require: "aws/ses" # Needed by exception_notification
gem "exception_notification"

group :development, :test do
  gem "pry-rails"
end

group :test do
  gem "brakeman", "~> 1.7.0"
  gem "ci_reporter"
  gem "factory_girl_rails"
  gem "shoulda-matchers"
  gem "simplecov", "~> 0.6.4"
  gem "simplecov-rcov", "~> 0.2.3"
  gem "rspec-rails"
  gem "capybara", "~> 2.1.0"
  gem "webmock"
end

group :assets do
  gem "sass-rails",   "~> 4.0.0"
  gem "coffee-rails", "~> 4.0.0"
  gem "uglifier", ">= 1.0.3"
  gem "jquery-rails"
  gem "bootstrap-sass"
  gem "govuk_frontend_toolkit", ">= 0.15.0"
  gem "therubyracer"
end
