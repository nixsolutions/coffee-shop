# frozen_string_literal: true

module Types
  class VariantsConnectionType < ::Types::BaseConnection
    edge_type(Types::VariantEdgeType)
  end
end
