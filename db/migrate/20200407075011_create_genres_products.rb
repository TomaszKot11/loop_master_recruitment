class CreateGenresProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :genres_products do |t|
      t.references :product
      t.references :genre
      t.timestamps
    end
  end
end
