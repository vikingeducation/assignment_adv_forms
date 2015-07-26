class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.string :title, :null => false

      t.timestamps null: false
    end
    add_index :achievements, :title, :unique => true
  end
end
