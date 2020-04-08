# frozen_string_literal: true

class SearchingService < ApplicationService
  def call
    operate
  end

  private

  def operate
    model_query_name_arr = @service_params.fetch(:query, nil)&.split(':')
    if model_query_name_arr&.count != 2
      @flash[:alert] = I18n.t('wrong_query') unless @flash.nil?
      return []
    end

    @model_name = model_query_name_arr.first.capitalize
    @name = model_query_name_arr.second.capitalize

    perform_search
  end

  def perform_search
    return Product.where(title: @name) if @model_name == 'Product'

    # I assume both Label and Genre have name column
    if %w[Genre Label].include? @model_name
      return @model_name.constantize.where(name: @name)
                        .includes(:products).map(&:products).flatten
    end

    []
  end
end
