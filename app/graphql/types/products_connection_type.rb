# frozen_string_literal: true

module Types
  class ProductsConnectionType < ::Types::BaseConnection
    edge_type(Types::ProductEdgeType)
  end
end
