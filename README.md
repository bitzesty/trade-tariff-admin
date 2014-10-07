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

## Development with Docker and Fig

### Fig / Docker setup

#### 1. Install docker and fig
   Check out [Install Guide](http://www.fig.sh/install.html)

#### 2. Build fig in app root.
   NOTE: can take some time to download and build some docker images

   ```
   fig build && fig up -d
   ```

#### 3. Prepare database in admin docker containers:
   ```
   fig run admin bundle exec db:create db:migrate db:seed
   ```

#### 4. Now you can open in browser:
   ##### [ADMIN Root](http://tariff-admin.dev.gov.uk:3046)
   ##### NOTE: that you also need to setup api and frontend apps with docker.

### Development via Docker / Fig

#### Deploy latest version of app to docker / fig container

   NOTE: it's important to pass '--no-recreate' option for 'fig up' command.
         By default 'fig up' will recreate all environment (including database)

   ```
   fig stop && fig up -d --no-recreate
   ```

#### Start / stop server

   ```
   fig stop
   fig start
   ```

#### Run db migrations / seeds

   ```
   fig run admin bundle exec rake db:migrate
   fig run admin bundle exec rake db:seed
   ```

#### Rails console

   ```
   fig run admin bundle exec rails console
   ```

#### View app logs

   ```
   fig logs admin
   ```

#### Run Rspec tests

   ```
   fig run admin bundle exec rake spec
   ```

#### SSH to docker app
 
   ```
   $ fig run admin /bin/sh
   root@af8bae53bdd3:/#

   # when you're done you can use the exit command to finish.
   # root@af8bae53bdd3:/# exit
   ```
