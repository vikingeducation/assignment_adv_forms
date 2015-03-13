class CreateHunters < ActiveRecord::Migration
  def change
    create_table :hunters do |t|
      t.string :name
      t.string :town

      t.timestamps null: false
    end
  end
end
