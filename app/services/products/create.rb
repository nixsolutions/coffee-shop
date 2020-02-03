# frozen_string_literal: true

module Products
  class Create
    include Callable

    def initialize(params:, permit:)
      @params = params
      @permit = permit
    end

    def call
      create_product
    end

    private

    attr_reader :params, :permit

    def create_product
      product = ShopifyAPI::Product.create(permit)
      add_metafield(product, "position", params[:shopify_api_product][:value])
      product.save
      product.variants[0].price = params[:shopify_api_product][:price]
      product.variants[0].weight = params[:shopify_api_product][:weight]
      product.save
      add_image(product) if params[:shopify_api_product][:image]
      product
    end

    def add_image(product)
      image = ShopifyAPI::Image.new
      f = File.read(params[:shopify_api_product][:image].tempfile)
      image.attach_image(f)
      product.images << image
    end

    def add_metafield(product, key, value)
      product.add_metafield(ShopifyAPI::Metafield.new(
                              description: key,
                              namespace:   "inventory",
                              key:         key,
                              value:       value,
                              owner_type:  "PRODUCT",
                              value_type:  "string"
                            ))
    end
  end
end
