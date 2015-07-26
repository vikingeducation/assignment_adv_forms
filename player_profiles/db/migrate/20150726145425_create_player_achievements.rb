class CreatePlayerAchievements < ActiveRecord::Migration
  def change
    create_table :player_achievements do |t|
      t.integer :player_id, :null => false
      t.integer :achievement_id, :null => false

      t.timestamps null: false
    end
    add_index :player_achievements, [:player_id, :achievement_id], :unique => true
  end
end
