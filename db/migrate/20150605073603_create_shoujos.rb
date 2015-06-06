class CreateShoujos < ActiveRecord::Migration
  def change
    create_table :shoujos do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
