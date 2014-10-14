class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title, :null => false
      t.text :body, :null => false
      t.string :source, :null => false
      t.integer :product_id, :null => false
      t.timestamps
    end
  end
end
