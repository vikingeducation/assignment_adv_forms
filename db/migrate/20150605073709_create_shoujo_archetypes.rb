class CreateShoujoArchetypes < ActiveRecord::Migration
  def change
    create_table :shoujo_archetypes do |t|
      t.integer :shoujo_id
      t.integer :archetype_id

      t.timestamps null: false
    end
  end
end
