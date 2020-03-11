# frozen_string_literal: true

module Types
  class ImageType < BaseObject
    field :id, ID, null: true
    field :product_id, ID, null: true
    field :position, Int, null: true
    field :width, Int, null: true
    field :height, Int, null: true
    field :src, String, null: true
  end
end
