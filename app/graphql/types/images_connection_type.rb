# frozen_string_literal: true

module Types
  class ImagesConnectionType < ::Types::BaseConnection
    edge_type(Types::ImageEdgeType)
  end
end
