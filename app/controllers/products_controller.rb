# frozen_string_literal: true

class ProductsController < AuthenticatedController
  def index
    @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
  end

  def new

    binding.pry

    @product = ShopifyAPI::Product.new(set_attributes)
  end

  def create


    @product = ShopifyAPI::Product.new(params)

    # @product.add_metafield(ShopifyAPI::Metafield.new({
    #   :description => 'Location',
    #   :namespace => "inventory",
    #   :key => "position",
    #   :value => '123123213213213213213',
    #   :owner_type => "PRODUCT",
    #   :value_type => 'string'
    # }))

    if @product.save
      redirect_to @product
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
    @product.metafields[0].update_attributes(value: params[:position][:value])

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

  def permit_params
    params.permit(:title, :body_html, :product_type)
  end
end



