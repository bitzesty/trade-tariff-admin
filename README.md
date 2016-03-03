[![Circle CI](https://circleci.com/gh/bitzesty/trade-tariff-admin.svg?style=svg)](https://circleci.com/gh/bitzesty/trade-tariff-admin)

# TradeTariffAdmin

The web interface for the administration of the UK Trade Tariff, to be used with:

* [Trade Tariff Backend](https://github.com/alphagov/trade-tariff-backend)
* [Trade Tariff Frontend](https://github.com/alphagov/trade-tariff-frontend)

Please ensure the API is running and properly configured in the
environment files.

Assumes the GDS development environment is setup via puppet.

## Run TradeTariffAdmin

    ./startup.sh

## Specs

To run the spec use the following command:

    govuk_setenv tariff env RAILS_ENV=test bundle exec rake ci:setup:rspec spec assets:clean assets:precompile
