class CreateEpisodes < ActiveRecord::Migration[5.2]
  def change
    create_table :episodes do |t|
      t.references :season, foreign_key: true
      t.string :title
      t.integer :likes
      t.integer :dislikes

      t.timestamps
    end
  end
end
