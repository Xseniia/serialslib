class CreateEpisodes < ActiveRecord::Migration[5.2]
  def change
    create_table :episodes, id: :uuid do |t|
      t.references :season, type: :uuid, foreign_key: true
      t.integer :count
      t.string :title
      t.integer :likes
      t.integer :dislikes

      t.timestamps
    end
  end
end
