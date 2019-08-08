class CreateViewStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :view_statuses, id: false do |t|
      t.references :serial, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.string :status, null: false
    end
  end
end
