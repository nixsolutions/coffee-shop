# frozen_string_literal: true

class ProductsController < AuthenticatedController
  def index
    @products = ShopifyAPI::Product.find(:all)
  end

  def new
    @product = ShopifyAPI::Product.new(set_empty_attributes)
  end

  def create
    @product = Products::Create.call(permit_params)
    render :show
  end

  def show
    @product = ShopifyAPI::Product.find(params[:id])
  end

  def edit
    @product = ShopifyAPI::Product.find(params[:id])
  end

  def update
    @product = Products::Update.call(permit_params)
    render :show
  end

  def destroy
    ShopifyAPI::Product.find(params[:id]).destroy
  end

  private

  def set_empty_attributes
    {
      title:        "",
      body_html:    "",
      product_type: "PRODUCT",
      variants:     [
        {
          price:  "",
          weight: ""
        }
      ],
      metafields:   [
        {
          value: ""
        }
      ]
    }
  end

  def permit_params
    params
      .permit(
        :id,
        shopify_api_product: %i[title body_html product_type],
        variants:            %i[weight price],
        metafields:          [:value]
      )
      .merge(vendor: "nixshoptest")
  end
end
