class CreateSlogans < ActiveRecord::Migration
  def change
    create_table :slogans do |t|
      t.string :name

      t.timestamps
    end
  end
end
