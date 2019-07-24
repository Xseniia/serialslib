class AddCountryIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :country, type: :uuid, foreign_key: true
  end
end
