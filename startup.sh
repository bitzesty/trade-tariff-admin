#!/bin/bash
bundle exec whenever --update-crontab
bundle exec unicorn -p 3046
exit 0
