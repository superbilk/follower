class AddUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_index :users, :username
    add_index :users, [:username, :provider], unique: true
  end
end
