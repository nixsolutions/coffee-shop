# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :all_products, ProductsConnectionType, null: true,
          resolver: Resolvers::ProductsResolver, connection: true
  end
end
