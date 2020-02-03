# frozen_string_literal: true

class ApplicationController < ActionController::Base
  SHOPIFY_DOMAIN = Rails.application.secrets.shopify_domain
  protect_from_forgery with: :null_session
end
