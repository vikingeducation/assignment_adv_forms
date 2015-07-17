class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
    	t.string :first_name
    	t.string :last_name, :null => false
    	t.string :email, :null => false

      t.timestamps null: false
    end

  end
end
