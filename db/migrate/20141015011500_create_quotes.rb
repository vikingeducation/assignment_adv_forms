class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.string :text, :null => false

      t.timestamps
    end
  end
end
