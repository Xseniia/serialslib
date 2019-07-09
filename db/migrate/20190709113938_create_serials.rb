class CreateSerials < ActiveRecord::Migration[5.2]
  def change
    create_table :serials, id: :uuid do |t|
      t.string :title
      t.integer :since

      t.timestamps
    end
  end
end
