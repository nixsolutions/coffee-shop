# frozen_string_literal: true

module Types
  class VariantEdgeType < GraphQL::Types::Relay::BaseEdge
    node_type(Types::VariantType)
  end
end
