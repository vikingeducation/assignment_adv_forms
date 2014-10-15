class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.integer :actor_id, :null => false
      t.integer :movie_id, :null => false

      t.timestamps
    end

    add_index :roles, [:actor_id, :movie_id], :unique => true
  end
end
