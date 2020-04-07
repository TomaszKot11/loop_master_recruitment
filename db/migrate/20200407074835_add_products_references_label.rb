# frozen_string_literal: true

class AddProductsReferencesLabel < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :label, index: true
  end
end
