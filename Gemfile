source "https://rubygems.org"
source "https://BnrJb6FZyzspBboNJzYZ@gem.fury.io/govuk/"

gem "addressable", "2.3.5"
gem "aws-ses", require: "aws/ses" # Needed by exception_notification
gem "exception_notification", "4.0.0"
gem "gds-api-adapters", "7.2.0"
gem "gds-sso", github: "alphagov/gds-sso", branch: "master", ref: "bf4b6d13a1"
gem "her", "0.6.8"
gem "jquery-rails", "3.0.4"
gem "kaminari", "0.14.1"
gem "lograge", "0.1.2"
gem "mysql2", "0.3.13"
gem "plek", "1.4.0"
gem "pundit", "0.2.1"
gem "rails", "4.0.0"
gem "sequel", "4.0.0"
gem "sequel-rails", "0.5.1"
gem "simple_form", github: "plataformatec/simple_form", branch: "master", ref: "87323fd62"
gem "unicorn", "4.6.3"

group :development, :test do
  gem "pry-rails", "0.3.2"
end

group :test do
  gem "brakeman", "1.7.1"
  gem "capybara", "2.1.0"
  gem "ci_reporter", "1.9.0"
  gem "factory_girl_rails", "4.2.1"
  gem "rspec-rails", "2.14.0"
  gem "shoulda-matchers", "2.2.0"
  gem "simplecov", "0.6.4"
  gem "simplecov-rcov", "0.2.3"
  gem "webmock", "1.13.0"
end

group :assets do
  gem "bootstrap-sass", "2.3.2.1"
  gem "coffee-rails", "4.0.0"
  gem "sass-rails", "4.0.0"
  gem "therubyracer", "0.11.4"
  gem "uglifier", "2.1.2"
end
