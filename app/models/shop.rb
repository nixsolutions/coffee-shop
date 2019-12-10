# frozen_string_literal: true

class Shop < ActiveRecord::Base
  include ShopifyApp::SessionStorage

  def api_version
    ShopifyApp.configuration.api_version
  end
end
