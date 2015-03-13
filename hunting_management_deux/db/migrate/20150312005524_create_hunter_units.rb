class CreateHunterUnits < ActiveRecord::Migration
  def change
    create_table :hunter_units do |t|
     t.integer :hunter_id
     t.integer :unit_id
     
     t.timestamps null: false
    end

    # add_index :hunter_units, [:hunter_id, :unit_id], :unique => true
  end
end

