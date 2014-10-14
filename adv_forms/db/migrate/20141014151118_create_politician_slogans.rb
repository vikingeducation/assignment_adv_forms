class CreatePoliticianSlogans < ActiveRecord::Migration
  def change
    create_table :politician_slogans do |t|
      t.integer :politician_id
      t.integer :slogan_id

      t.timestamps
    end
  end
end
