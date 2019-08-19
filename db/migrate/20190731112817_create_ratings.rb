class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings, id: false do |t|
      t.references :user, foreign_key: true, null: false
      t.references :serial, foreign_key: true, null: false
      t.integer :value, null: false

      t.timestamps
    end
  end
end
