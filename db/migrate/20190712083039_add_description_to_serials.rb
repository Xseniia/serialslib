class AddDescriptionToSerials < ActiveRecord::Migration[5.2]
  def self.up
    add_column :serials, :description, :text, null: false
  end

  def self.down
    remove_column :serials, :description
  end
end
