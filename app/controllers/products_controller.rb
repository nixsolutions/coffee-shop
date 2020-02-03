# frozen_string_literal: true

class ProductsController < AuthenticatedController
  def index
    @products = ShopifyAPI::Product.find(:all)
  end

  def new
    @product = ShopifyAPI::Product.new(set_attributes)
  end

  def create
    @product = Products::Create.call(params: params, permit: permit_params)
    render :show
  end

  def show
    @product = ShopifyAPI::Product.find(params[:id])
  end

  def edit
    @product = ShopifyAPI::Product.find(params[:id])
  end

  def update
    @product = Products::Update.call(params: params)
    render :show
  end

  def destroy
    ShopifyAPI::Product.find(params[:id]).destroy
  end

  def set_attributes
    {
      title:        "",
      body_html:    "",
      product_type: "PRODUCT",
      value:        "",
      price:        "",
      weight:       ""
    }
  end

  private

  def permit_params
    params[:shopify_api_product]
      .permit(:title, :body_html, :product_type)
      .merge(vendor: "nixshoptest")
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
