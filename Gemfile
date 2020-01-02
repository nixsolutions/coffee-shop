# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) {|repo| "https://github.com/#{repo}.git" }

ruby "2.6.1"
gem "bootsnap", ">= 1.1.0", require: false
gem "graphql"
gem "graphql-batch"
gem "pg"
gem "puma", "~> 3.11"
gem "rails", "~> 5.2.4"
gem "rubocop"
gem "shopify_api"

gem "rack-cors", require: "rack/cors"
group :development, :test do
  gem "pry"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :test do
end

gem "shopify_app"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

gem "dotenv-rails", group: %i[test development]

gem "graphiql-rails", group: :development
