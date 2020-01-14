# frozen_string_literal: true

class Shop < ActiveRecord::Base
  include ShopifyApp::SessionStorage

  def api_version
    ShopifyApp.configuration.api_version
  end

  def connect_to_store
    session = ShopifyAPI::Session.new(domain: shopify_domain, token: shopify_token, api_version: api_version)
    session.valid?
    ShopifyAPI::Base.activate_session(session)
    session
  end
end
