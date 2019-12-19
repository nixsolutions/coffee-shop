# frozen_string_literal: true

class HomeController < AuthenticatedController
  def index
    binding.pry
    @products = ShopifyAPI::Product.find(:all)
    @webhooks = ShopifyAPI::Webhook.find(:all)
  end
end
