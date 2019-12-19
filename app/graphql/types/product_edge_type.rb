# frozen_string_literal: true

module Types
  class ProductEdgeType < GraphQL::Types::Relay::BaseEdge
    node_type(Types::ProductType)
  end
end
