class CreateAnimes < ActiveRecord::Migration
  def change
    create_table :animes do |t|
      t.string :title
      t.integer :season_number
      t.integer :year
      t.integer :shoujo_id

      t.timestamps null: false
    end
  end
end
