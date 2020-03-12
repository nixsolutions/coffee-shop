# frozen_string_literal: true

module Products
  class Update < Base
    def initialize(params)
      @product = ShopifyAPI::Product.find(params[:id])
      @metafields = @product&.metafields&.first
      @params = params
    end

    def call
      set_fields
    end
  end
end
