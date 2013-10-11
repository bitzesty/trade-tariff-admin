[![Build Status](https://travis-ci.org/alphagov/trade-tariff-admin.png?branch=master)](https://travis-ci.org/alphagov/trade-tariff-admin)

# TradeTariffAdmin

A web application admin backend end for use with the UK Trade Tariff API.
Please ensure the API is running and properly configured in the
environment files.

Assumes the GDS development envrionment is setup via puppet.

## Run TradeTariffAdmin

    ./startup.sh

## Specs

To run the spec use the following command:

    govuk_setenv tariff env RAILS_ENV=test bundle exec rake ci:setup:rspec spec assets:clean assets:precompile
