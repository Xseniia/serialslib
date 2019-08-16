class AddIndexes < ActiveRecord::Migration[5.2]
  def change
    add_index :ratings, %i[user_id serial_id], unique: true
    add_index :favourites, %i[user_id serial_id], unique: true
    add_index :view_statuses, %i[user_id serial_id], unique: true
    add_index :serial_actors, %i[serial_id actor_id], unique: true
    add_index :serial_genres, %i[serial_id genre_id], unique: true
    add_index :serial_tags, %i[serial_id tag_id], unique: true
    add_index :tags, :tag_name, unique: true
  end
end
