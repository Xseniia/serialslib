class CreateSerialActors < ActiveRecord::Migration[5.2]
  def change
    create_table :serial_actors, id: false do |t|
      t.references :serial, foreign_key: true, null: false
      t.references :actor, foreign_key: true, null: false
    end
  end
end
