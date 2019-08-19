class CreateSerialTags < ActiveRecord::Migration[5.2]
  def change
    create_table :serial_tags, id: false do |t|
      t.references :serial, foreign_key: true, null: false
      t.references :tag, foreign_key: true, null: false

      t.timestamps
    end
  end
end
