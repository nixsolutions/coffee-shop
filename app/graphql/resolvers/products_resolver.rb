# frozen_string_literal: true

module Resolvers
  class ProductsResolver < GraphQL::Schema::Resolver
    type Types::ProductsConnectionType, null: true

    def resolve
      ShopifyAPI::Product.find(:all, params: {limit: 10}).to_a
    end
  end
end
