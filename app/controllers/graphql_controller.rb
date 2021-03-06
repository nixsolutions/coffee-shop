# frozen_string_literal: true

class GraphqlController < ApplicationController
  before_action :connect_to_store, only: [:execute]

  def execute
    variables = ensure_hash(params[:variables])
    query = params[:query]
    operation_name = params[:operationName]
    context = {
      # current_user: current_user,
    }
    result = CoffeeShopSchema.execute(
      query,
      variables:      variables,
      context:        context,
      operation_name: operation_name
    )
    render json: result
  rescue StandardError => e
    raise e unless Rails.env.development?

    handle_error_in_development e
  end

  private

  def connect_to_store
    Shop.first.connect_to_store
  end

  def ensure_hash(ambiguous_param)
    case ambiguous_param
    when String
      if ambiguous_param.present?
        ensure_hash(JSON.parse(ambiguous_param))
      else
        {}
      end
    when Hash, ActionController::Parameters
      ambiguous_param
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
    end
  end

  def handle_error_in_development(error)
    logger.error error.message
    logger.error error.backtrace.join("\n")

    render json: {error: {message: error.message, backtrace: error.backtrace}, data: {}}, status: :internal_server_error
  end
end
