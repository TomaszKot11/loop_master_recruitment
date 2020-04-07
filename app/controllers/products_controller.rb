# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  # I assume only product filtering by genre/label and by title
  def simple_search
    @products = SearchingService.new(service_params: {
                                       query: params[:query]
                                     }).call
    render 'search_results'
  end
end
