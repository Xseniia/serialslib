class CreateUsersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :users, id: :uuid do |t|
      t.text :first_name
      t.text :last_name
      t.text :username
      t.date :date_of_birth
      t.text :gender
      t.text :email

      t.timestamp
    end
  end
end
