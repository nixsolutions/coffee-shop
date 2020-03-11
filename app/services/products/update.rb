# frozen_string_literal: true

module Products
  class Update < Base
    def initialize(params)
      @product = ShopifyAPI::Product.find(params[:id])
      @metafields = product&.metafields&.first
      @params = params
    end

    def call
      update_product
    end

    private

    attr_reader :params, :product, :metafields

    def update_product
      set_fields
      set_metafields
      set_image

      product.save
      product
    end
  end
end
