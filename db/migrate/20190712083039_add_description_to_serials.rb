class AddDescriptionToSerials < ActiveRecord::Migration[5.2]
  def self.up
    add_column :serials, :description, :text
  end

  def self.down
    remove_column :serials, :description
  end
end
