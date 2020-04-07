# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :genres_products
  has_many :genres, through: :genres_products
  belongs_to :label, optional: true
end
