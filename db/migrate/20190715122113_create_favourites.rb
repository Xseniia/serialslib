class CreateFavourites < ActiveRecord::Migration[5.2]
  def change
    create_table :favourites, id: false do |t|
      t.references :serial, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
