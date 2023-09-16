#!/usr/bin/env bash
# exit on error
set -o errexit
bundle install
yarn install
bundle exec rake assets:precompile # cssはsprocketsを使っているため
bin/rails db:migrate RAILS_ENV=production # migrateはridgepoleを使っているため（標準のmigrateを使うならbundle exec rails db:migrateで良いかと思います）