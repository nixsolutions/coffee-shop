# frozen_string_literal: true

module Types
  # Base Connection Class
  class BaseConnection < GraphQL::Types::Relay::BaseConnection
    field :total_count, Integer, "Total # of objects returned from this Plural Query", null: false
    def total_count
      object.nodes&.count
    end

    field :total_page_count, Integer, "Total # of pages, based on total count and pagesize", null: false

    def total_page_count
      return default_page_count unless object.nodes&.count&.positive?

      my_total_count = object.nodes&.count
      possible_page_sizes = [my_total_count]

      actual_page_size = possible_page_sizes.min
      setup_page_size(actual_page_size)

      (my_total_count / actual_page_size.to_f).ceil
    end

    private

    def default_page_count
      1
    end

    def setup_page_size(possible_page_sizes)
      possible_page_sizes.push(object.arguments[:first]) if object.arguments[:first]
      possible_page_sizes.push(object.arguments[:last]) if object.arguments[:last]
    end
  end
end
