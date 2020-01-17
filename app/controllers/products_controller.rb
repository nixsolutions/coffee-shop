# frozen_string_literal: true

class ProductsController < AuthenticatedController
  def index
    @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
  end

  def new
    @product = ShopifyAPI::Product.new(set_attributes)
  end

  def create
    @product = ShopifyAPI::Product.create(permit_params)

    if @product.save
      render :show
    else
      render :new
    end
  end

  def show
    @product = ShopifyAPI::Product.find(params[:id])
  end

  def edit
    @product = ShopifyAPI::Product.find(params[:id])
  end

  def update
    @product = ShopifyAPI::Product.find(params[:id])
    @product.title = params[:shopify_api_product][:title]
    @product.body_html = params[:shopify_api_product][:body_html]
    @product.product_type = params[:shopify_api_product][:product_type]
    @product.variants[0].price = params[:variant][:price]

    if @product.metafields[0].nil?
      add_position(@product, params[:position][:value]) 
    else
      @product.metafields[0].update_attributes(value: params[:position][:value])
    end

    if @product.save
      render :show
    else
      render :edit
    end
  end

  def destroy
    ShopifyAPI::Product.find(params[:id]).destroy
  end

  def set_attributes
    {
      title: "",
      body_html: "",
      product_type: "",
    }
  end

  private 

  def add_position(product, value)
    product.add_metafield(ShopifyAPI::Metafield.new({
      :description => 'Location',
      :namespace => "inventory",
      :key => "position",
      :value => value,
      :owner_type => "PRODUCT",
      :value_type => 'string'
    }))
  end

  def permit_params
    params[:shopify_api_product]
      .permit(:title, :body_html, :product_type)
      .merge({ vendor: "nixshoptest" })
  end
end


# Create metafieldStorefrontVisibility
#
# client = ShopifyAPI::GraphQL.new

# SHOP_NAME_QUERY = client.parse <<-'GRAPHQL'
# mutation {
#   metafieldStorefrontVisibilityCreate(
#   input: {
#     namespace: "test",
#     key: "test",
#     ownerType: PRODUCT
#   }
#   ) {
#     metafieldStorefrontVisibility {
#       id
#     }
#     userErrors {
#       field
#       message
#     }
#   }
# }
# GRAPHQL

# result = client.query(SHOP_NAME_QUERY)
# result.data.shop.name