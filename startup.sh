#!/bin/bash

bundle install
bundle exec unicorn -p 3046
