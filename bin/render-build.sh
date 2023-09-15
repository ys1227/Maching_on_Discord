set -o errexit

bundle install
yarn install
yarn build:css # jsファイルをesbuildでバンドルしているため
bundle exec rake assets:precompile # cssはsprocketsを使っているため
bundle exec ridgepole -c config/database.yml -E production --apply -f db/schemas/Schemafile # migrateはridgepoleを使っているため（標準のmigrateを使うならbundle exec rails db:migrateで良いかと思います）