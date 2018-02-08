# Change Log

## [February 18, 2018]

### Changed

- Update `ruby` version to 2.5.0

## [January 18, 2018]

### Changed
- Update `ruby` version to `2.4.3`.

## [August 28, 2017]

### Added
- Notify GDS when deploy is done
- Snyk

### Changed
- Run bootscaler regenerate when loadpath changes
- `Rails` upgraded to 5.1.3, `coffee-rails` to 4.2.2
- Update `ruby` version to `2.4.1`.
- Updated .cfignore
- Updated `ruby` to 2.3.3
- Upgrade `sentry-raven` to 2.4.0
- Upgrade gems for :test group
- Upgrade `kaminari` to 1.0
- Upgrade `sinatra` to 2.0
- Upgrade `jquery-rails` to 4.1
- Upgrade `coffee-rails` to 4.2.2
- Upgrade `simple_form` to 3.5
- Upgrade `gds-sso` to 13.2

### Removed

[August 28, 2017]: https://github.com/bitzesty/trade-tariff-admin/compare/8d5804b...51865f5

## [August 03, 2016]

### Added
- Add `lograge` gem.
- Add `dalli` gem.
- Ignore all manifest files from CloudFoundry from git.
- Add `deploy` script.

### Changed
- Update `gds-sso` gem.
- Switch from `logstasher` to `lograge` gem for logging.
- Set the server name in Raven.

### Removed
- Remove `logstasher` gem.
- Remove `referenced` association from Search Reference model

[August 03, 2016]: https://github.com/bitzesty/trade-tariff-admin/compare/b2130cd...e6a4f03

## [July 08, 2016]

### Added
- Add missing log_level for production enviroment.
- Add `.cfignore` file as a symlink of the `.gitignore`.
- Make `force_ssl` settable via an ENV var.
- Ensure puma establishes DB connection on boot.
- Add `sidekiq-scheduler` gem.
- Add `newrelic_rpm` gem.

### Changed
- Update `rails` version to `4.2.5.2`.
- Update `ruby` version to `2.3.1`.
- Update `sentry-raven` version to `1.2.0`.
- Switch from `Unicorn` to `Puma`.
- Switch from `Airbrake` to `Sentry`.

### Fixed
- Now the sidekiq monitor page shows the tab of recurring jobs.

### Removed
- Remove the `sidekiq` initializer.

[July 08, 2016]: https://github.com/bitzesty/trade-tariff-admin/compare/f00e98f...b2130cd

## [March 04, 2016]

### Added
- Add CodeClimate configuration file.
- Add `rails_12factor` gem.
- Add `database_cleaner` gem.
- Add `rspec_junit_formatter` gem.
- Add `govuk_admin_template` gem.
- Add the option to set the api_host value with the `TARIFF_API_HOST` enviroment variable.

### Changed
- Update `nokogiri` version to `1.6.7.2`.
- Update `rails` version to `4.2.5.1`.
- Update rails configuration files after running `rake rails:update`.
- Switch from `Sequel` to `ActiveRecord`, `gsd-sso` gem expects Active Record.
- Use enviroment variables for initializers.
- Update `ruby` verstion to `2.2.3`.

### Fixed
- Show rollback links for applied/failed updates only
- Fix issue with assets precompilation with new version of `govuk_admin_template`.

### Removed
- Remove `bundler-audit` gem and tasks.
- Remove `sequel`.
- Remove Travis configuration file.


[March 04, 2016]: https://github.com/bitzesty/trade-tariff-admin/compare/92ce432...658cf3e

## [December 03, 2015]

### Changed
- Update `nokogiri` gem.
- Update `govuk_admin_template` gem.
- Update `uglifier` gem.

[December 03, 2015]: https://github.com/bitzesty/trade-tariff-admin/compare/65d0767...92ce432

## [release_237...release_246](https://github.com/alphagov/trade-tariff-admin/compare/release_237...release_246)
### Changed

- Upgrading to Rails 4.2.3
- Fix Rspec deprications and make deprications raise errors in specs
- Security updates

## [release_214...release_237](https://github.com/alphagov/trade-tariff-admin/compare/release_214...release_237)
### Changed

- Fixed bundler audit in production
- Corrected copyright notice
- Modified template to use govuk_admin_template
- Minor enhances to markup/styles
- Changed datapickers format to yyyy/mm/dd
- Upgraded Ruby version to 2.2.2
- Upgraded Rails version to 4.2.0
- Upgraded gds-api-adapters, gds-sso, gov-speak among other gems


### Added
- Added Rollbacks from updates page
- Added pagination to rollbacks
- Added pagination to updates

## [release_210...release_214](https://github.com/alphagov/trade-tariff-admin/compare/release_210...release_214)
### Changed
- upgraded breakman

### Added
- bundler-audit added to check for security vulnerabilities

## [release_197...release_210](https://github.com/alphagov/trade-tariff-admin/compare/release_197...release_210)
### Changed
- Update Ruby to 2.1.4 from 1.9.3
- Update Rails to 4.1.8 from 4.0.3
- Button colors are now consistent

### Added
- Display conformance errors
