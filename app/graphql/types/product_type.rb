# frozen_string_literal: true

module Types
  class ProductType < BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :images, ImagesConnectionType, null: true
    field :tags, String, null: true
    field :variants, VariantsConnectionType, null: false
    field :product_type, String, null: false
  end
end
