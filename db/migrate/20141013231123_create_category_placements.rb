class CreateCategoryPlacements < ActiveRecord::Migration
  def change
    create_table :category_placements do |t|
      t.integer :product_id
      t.integer :category_id
      t.timestamps
    end
  end
end
