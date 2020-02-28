# frozen_string_literal: true

module Products
  class Base
    include Callable

    private

    attr_reader :params, :product, :metafields

    def set_fields
      product.attributes = base_fields
      product.save
    end

    def set_image
      return unless product_image

      image_file = File.read(product_image.tempfile)
      image = ShopifyAPI::Image.new.attach_image(image_file)
      product.images << image
    end

    def set_metafields
      if metafields.nil?
        add_metafield
      elsif !params[:position].nil?
        metafields.update(value: metafield_value)
      end
    end

    def add_metafield
      product.add_metafield(ShopifyAPI::Metafield.new(
                              description: "position",
                              namespace:   "inventory",
                              key:         "position",
                              value:       params[:metafields][:value],
                              owner_type:  "PRODUCT",
                              value_type:  "string"
                            ))
      product.save
    end

    def product_image
      params[:shopify_api_product][:image]
    end

    def metafield_value
      params[:shopify_api_product][:value]
    end

    def base_fields
      {
        title:        params[:shopify_api_product][:title],
        body_html:    params[:shopify_api_product][:body_html],
        product_type: "PRODUCT",
        variants:     [setup_variant]
      }
    end

    def setup_variant
      ShopifyAPI::Variant.new(variant_fileds)
    end

    def variant_fileds
      {
        price:  params[:variants][:price],
        weight: params[:variants][:weight]
      }
    end
  end
end
