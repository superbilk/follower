class AddAttributesToTwitterAccounts < ActiveRecord::Migration
  def change
    add_column :twitter_accounts, :followers_count, :integer
    add_column :twitter_accounts, :friends_count, :integer
  end
end
