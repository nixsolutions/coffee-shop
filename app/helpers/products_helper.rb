# frozen_string_literal: true

module ProductsHelper
  def image_url(product)
    product.image.nil? ? default_image_path : product.image.attributes["src"]
  end

  def default_image_path
    "https://shop.tastycoffee.ru/files/shares/data/_newpack5/espresso-mono/brazil-cerrado-025.png"
  end

  def form_product_url(product:)
    case controller.action_name
    when "new"
      products_path
    when "edit"
      product_path(product)
    end
  end
end
