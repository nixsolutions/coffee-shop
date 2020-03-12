# frozen_string_literal: true

module Products
  class Base
    include Callable

    private

    attr_reader :params
    attr_accessor :product, :metafields

    def set_fields
      base_fields
      setup_variant
      set_metafields
      set_image
      product.save
    end

    def set_image
      return unless product_image

      image_file = File.read(product_image.tempfile)
      image = ShopifyAPI::Image.new.attach_image(image_file)
      product.images << image
    end

    def set_metafields
      return add_metafield if metafields.nil?

      update_metafield if metafield_value
    end

    def add_metafield
      product.add_metafield(ShopifyAPI::Metafield.new(
                              description: "position",
                              namespace:   "inventory",
                              key:         "position",
                              value:       metafield_value,
                              owner_type:  "product",
                              owner_id:    product.id,
                              value_type:  "string"
                            ))
      product.save
    end

    def update_metafield
      metafields.value = metafield_value
      product.save
    end

    def base_fields
      product.attributes[:title] = params[:shopify_api_product][:title]
      product.attributes[:body_html] = params[:shopify_api_product][:body_html]
    end

    def setup_variant
      product.attributes[:variants][0].price = params[:variants][:price]
      product.attributes[:variants][0].weight = params[:variants][:weight]
    end

    def product_image
      params[:shopify_api_product][:image]
    end

    def metafield_value
      params[:metafields][:value]
    end
  end
end
