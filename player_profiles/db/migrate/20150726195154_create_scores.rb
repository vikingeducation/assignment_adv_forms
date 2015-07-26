class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :player_id, :null => false
      t.string :game_type, :null => false
      t.integer :score, :null => false

      t.timestamps null: false
    end
  end
end
