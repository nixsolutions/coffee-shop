module Products
  class Update
    include Callable

    def initialize(params:)
      @params = params
    end

    def call
      update_product
    end

    private

    attr_reader :params

    def update_product
      product = ShopifyAPI::Product.find(params[:id])
      product.title = params[:shopify_api_product][:title]
      product.body_html = params[:shopify_api_product][:body_html]
      product.product_type = params[:shopify_api_product][:product_type]
      product.variants[0].price = params[:variant][:price]
      product.variants[0].price = params[:variant][:weight]
      add_image if params[:shopify_api_product][:image]
      product.namespace = :inventory

      metafields = product.metafields
      metafields.delete_if { |meta| meta.key != "position" }

      if metafields.empty?
        add_metafield(product, "position", params[:metafields][:value])
      elsif !params[:position].nil?
        metafields[0].update_attributes(value: params[:metafields][:value])
      end

      product.save
      product
    end

    def add_image
      image = ShopifyAPI::Image.new
      f = File.read(params[:shopify_api_product][:image].tempfile)
      image.attach_image(f)
      product.images << image
    end

    def add_metafield(product, key, value)
      product.add_metafield(ShopifyAPI::Metafield.new({
        :description => key,
        :namespace => "inventory",
        :key => key,
        :value => value,
        :owner_type => "PRODUCT",
        :value_type => 'string'
      }))
    end
  end
end
