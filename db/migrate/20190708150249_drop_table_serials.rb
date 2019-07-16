class DropTableSerials < ActiveRecord::Migration[5.2]
  def change
    drop_table :serials
  end
end
