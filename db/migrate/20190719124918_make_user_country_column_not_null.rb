class MakeUserCountryColumnNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :users, :country_id, false
  end
end
