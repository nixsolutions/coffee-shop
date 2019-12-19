# frozen_string_literal: true

module Types
  class VariantType < BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :position, Int, null: false
    field :inventory_quantity, Int, null: true
    field :price, Int, null: true
    field :sku, String, null: true
  end
end
