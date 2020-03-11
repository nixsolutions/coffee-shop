# frozen_string_literal: true

module Products
  class Create < Base
    def initialize(params)
      @params = params
      @product = ShopifyAPI::Product.new(params.except(:metafields))
    end

    def call
      create_product
    end

    private

    attr_reader :params, :product

    def create_product
      set_fields
      set_metafields
      set_image

      product.save
      product
    end
  end
end
