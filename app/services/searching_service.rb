# frozen_string_literal: true

class SearchingService < ApplicationService
  def call
    operate
  end

  private

  def validate_query_format
    model_query_name_arr = @service_params.fetch(:query, nil)&.split(':')
    return [] if model_query_name_arr&.count != 2
  end

  def operate
    validate_query_format

    model_name = @model_query_name_arr.first.capitalize
    name = @model_query_name_arr.second.capitalize
    return Product.where(title: name) if model_name == 'Product'

    # I assume both Label and Genre have name column
    if %w[Genre Label].include? model_name
      return model_name.constantize.where(name: name)
                       .includes(:products).map(&:products).flatten
    end

    []
  end
end
