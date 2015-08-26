class CreateTwitterAccounts < ActiveRecord::Migration
  def change
    create_table :twitter_accounts, id: false do |t|
      t.bigint :id, :null => false
      t.string :screen_name, :null => false
      t.string :name, :null => false
      t.string :location
      t.string :image_https, :null => false
      t.text :description
      t.string :website
      t.string :twitter_url, :null => false

      t.timestamps null: false
    end
    add_index :twitter_accounts, :id, :unique => true
  end
end
