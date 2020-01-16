# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) {|repo| "https://github.com/#{repo}.git" }

ruby "2.6.5"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "~> 5.2.4"
# Use Puma as the app server
gem "puma", "~> 3.11"
# Use SCSS for stylesheets
gem "sass-rails", "~> 5.0"
# Use Uglifier as compressor for JavaScript assets
gem "uglifier", ">= 1.3.0"
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem "coffee-rails", "~> 4.2"
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks", "~> 5"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.5"
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.1.0", require: false

# Postgres adapter
gem "pg"

# Shopify integration
gem "shopify_api"

# Style lint
gem "rubocop"
gem "rubocop-rails"

# GraphQL integration
ruby "2.6.1"
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

group :development, :test do
  gem "dotenv-rails"
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
