class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
    	t.string :title
    	t.string :description
    	t.integer :author_id

      t.timestamps null: false
    end

    add_index :books, :author_id
  end
end
