# frozen_string_literal: true

module Products
  class Create < Base
    def initialize(params)
      @params = params
      @product = ShopifyAPI::Product.new(params.except(:metafields))
    end

    def call
      set_fields
    end
  end
end
