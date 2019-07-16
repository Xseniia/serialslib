class CreateFavourites < ActiveRecord::Migration[5.2]
  def change
    create_table :favourites, id: false do |t|
      t.references :serial, foreign_key: true, type: :uuid, null: false
      t.references :user, foreign_key: true, type: :uuid, null: false
    end
  end
end
