class AddShortcutToCountries < ActiveRecord::Migration[5.2]
  def change
    add_column :countries, :shortcut, :string, limit: 2, null: false
  end
end
