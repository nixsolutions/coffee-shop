# frozen_string_literal: true

class ApplicationController < ActionController::Base
  SHOPIFY_DOMAIN = Rails.application.secrets.shopify_domain
  protect_from_forgery with: :null_session

  private

  #def current_shop
  #  ShopifyAPI::Shop.current.domain
    #Shop.find_by!(shopify_domain: ShopifyAPI::Shop.current.domain)
  #end
end
