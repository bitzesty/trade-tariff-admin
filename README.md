[![Build Status](https://travis-ci.org/alphagov/trade-tariff-admin.png?branch=master)](https://travis-ci.org/alphagov/trade-tariff-admin)

# TradeTariffAdmin

The admin web application for use with the UK Trade Tariff API.

* [Trade Tariff Backend](https://github.com/alphagov/trade-tariff-backend)

Please ensure the API is running and properly configured in the
environment files.

Assumes the GDS development environment is setup via puppet.

## Run TradeTariffAdmin

    ./startup.sh

## Specs

To run the spec use the following command:

    govuk_setenv tariff env RAILS_ENV=test bundle exec rake ci:setup:rspec spec assets:clean assets:precompile
