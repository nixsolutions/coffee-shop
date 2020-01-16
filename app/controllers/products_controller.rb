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

    binding.pry

    @product = Product.new(params)

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
    binding.pry
    @product = ShopifyAPI::Product.find(params[:id])
    @prodcut.attributes = params

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

end



