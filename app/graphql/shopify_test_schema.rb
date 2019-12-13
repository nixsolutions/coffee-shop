# frozen_string_literal: true

class CoffeeShopSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
end
