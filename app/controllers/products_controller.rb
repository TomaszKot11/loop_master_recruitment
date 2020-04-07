# frozen_string_literal: true

# while using Ruby 2.7.1 we can get
# -> https://piechowski.io/post/last-arg-keyword-deprecated-ruby-2-7/ warning :)
class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  # I assume only product filtering by genre/label and by title
  def simple_search
    @products = SearchingService.new(service_params: {
                                       query: params[:query],
                                       flash: flash
                                     }).call
    render 'search_results'
  end
end
