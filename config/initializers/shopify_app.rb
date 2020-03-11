# frozen_string_literal: true

require "active_resource/connection"

ShopifyAPI::Base.api_version = "2019-10"

ShopifyApp.configure do |config|
  config.application_name = ENV.fetch("SHOPIFY_APP_NAME", "My Shopify App")
  config.api_key = ENV["SHOPIFY_API_KEY"]
  config.secret = ENV["SHOPIFY_API_SECRET"]
  config.old_secret = ""
  config.scope = "read_orders,
                  read_products,
                  write_content,
                  write_themes,
                  write_products,
                  write_customers,
                  write_inventory"
  config.embedded_app = false
  config.after_authenticate_job = false
  config.api_version = "2019-10"
  config.session_repository = Shop
end
