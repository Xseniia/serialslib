class AddCountryIdFieldToSerial < ActiveRecord::Migration[5.2]
  def up
    add_column :serials, :country_id, :uuid
  end

  def down
    remove_columns :serials, :country_id
  end
end
