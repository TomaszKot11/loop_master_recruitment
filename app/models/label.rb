# frozen_string_literal: true

class Label < ApplicationRecord
  has_many :products, dependent: :destroy
end
