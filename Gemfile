# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) {|repo| "https://github.com/#{repo}.git" }

ruby "2.6.5"

gem "bootsnap", ">= 1.1.0", require: false
gem "graphql"
gem "graphql-batch"
gem "pg"
gem "puma", "~> 3.11"
gem "rack-cors", require: "rack/cors"
gem "rails", "~> 5.2.4"
gem "rubocop"
gem "turbolinks"
gem "haml"
gem "haml-rails", "~> 2.0"
gem "bootstrap", '~> 4.4.1'
gem "jquery-rails"
gem "ckeditor"
gem "shopify_app"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
gem "dotenv-rails", group: %i[test development]
gem "graphiql-rails", group: :development

group :development, :test do
  gem "dotenv-rails"
  gem "pry"
  gem "rubocop"
  gem "rubocop-rails"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :test do
end


