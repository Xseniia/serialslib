class CreateSeasons < ActiveRecord::Migration[5.2]
  def change
    create_table :seasons do |t|
      t.references :serial, foreign_key: true
      t.boolean :is_full

      t.timestamps
    end
  end
end
