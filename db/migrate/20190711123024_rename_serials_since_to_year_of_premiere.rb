class RenameSerialsSinceToYearOfPremiere < ActiveRecord::Migration[5.2]
  def change
    rename_column :serials, :since, :year_of_premiere
  end
end
