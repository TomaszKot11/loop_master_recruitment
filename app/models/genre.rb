# frozen_string_literal: true

class Genre < ApplicationRecord
  has_many :genres_products
  has_many :products, through: :genres_products
end
