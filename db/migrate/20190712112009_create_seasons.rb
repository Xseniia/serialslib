class CreateSeasons < ActiveRecord::Migration[5.2]
  def change
    create_table :seasons, id: :uuid do |t|
      t.references :serial, type: :uuid, foreign_key: true
      t.integer :season_count
      t.boolean :is_full

      t.timestamps
    end
  end
end
