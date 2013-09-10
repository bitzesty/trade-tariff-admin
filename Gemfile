source "https://rubygems.org"
source "https://BnrJb6FZyzspBboNJzYZ@gem.fury.io/govuk/"

gem "rails", "4.0.0"

gem "mysql2", "0.3.13"
gem "sequel", "4.0.0"
gem "sequel-rails", "0.5.1"
gem "her", "0.6.8"
gem "pundit", "0.2.1"

gem "kaminari", "0.14.1"
gem "simple_form", github: "plataformatec/simple_form", branch: "master", ref: "87323fd62"

gem "gds-sso", github: "alphagov/gds-sso", branch: "master", ref: "bf4b6d13a1"
gem "gds-api-adapters", "> 4.1.3"
gem "plek", ">= 1.0.0"
gem "addressable", "2.3.5"

gem "unicorn", "~> 4.6.3"

gem "jquery-rails", "3.0.4"
gem "lograge", "0.1.2"
gem "aws-ses", require: "aws/ses" # Needed by exception_notification
gem "exception_notification", "4.0.0"
gem "twitter-bootstrap-rails", "2.2.8"

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
  gem "sass-rails", "4.0.0"
  gem "coffee-rails", "4.0.0"
  gem "uglifier", "2.1.2"
  gem "bootstrap-sass", "2.3.2.1"
  gem "therubyracer", "0.11.4"
end
