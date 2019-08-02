class RemoveIsFullFieldFromSeasons < ActiveRecord::Migration[5.2]
  def change
    remove_column :seasons, :is_full
  end
end
