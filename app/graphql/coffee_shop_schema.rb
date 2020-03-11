# frozen_string_literal: true

class CoffeeShopSchema < GraphQL::Schema
  query(Types::QueryType)
  # mutation(Types::MutationType)
  max_complexity 200
  max_depth 15
  use GraphQL::Batch
  rescue_from(ActiveRecord::RecordNotFound) { "An item could not be found" }
end
