# frozen_string_literal: true

ShopifyApp.configure do |config|
  config.application_name = "My Shopify App"
  config.api_key = ENV["SHOPIFY_API_KEY"]
  config.secret = ENV["SHOPIFY_API_SECRET"]
  config.old_secret = ""
  config.scope = "read_orders, read_products"
  config.embedded_app = true
  config.after_authenticate_job = false
  config.api_version = "2019-10"
  config.session_repository = ShopifyApp::InMemorySessionStore
end

# rubocop:disable Layout/LineLength
# ShopifyApp::Utils.fetch_known_api_versions                        # Uncomment to fetch known api versions from shopify servers on boot
# ShopifyAPI::ApiVersion.version_lookup_mode = :raise_on_unknown    # Uncomment to raise an error if attempting to use an api version that was not previously known
# rubocop:enable Layout/LineLength
