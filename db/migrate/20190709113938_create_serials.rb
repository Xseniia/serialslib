class CreateSerials < ActiveRecord::Migration[5.2]
  def change
    create_table :serials do |t|
      t.string :title, null: false
      t.integer :since

      t.timestamps
    end
  end
end
