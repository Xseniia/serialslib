class AddCountryIdFieldToSerial < ActiveRecord::Migration[5.2]
  def up
    add_reference :serials, :country
  end

  def down
    remove_reference :serials, :country
  end
end
