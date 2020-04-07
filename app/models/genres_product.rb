# frozen_string_literal: true

class GenresProduct < ApplicationRecord
  belongs_to :product
  belongs_to :genre
end
