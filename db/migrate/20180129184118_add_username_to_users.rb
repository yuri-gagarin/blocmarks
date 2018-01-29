class AddUsernameToUsers < ActiveRecord::Migration[5.1]
  def self.up
    add_column :users, :user_name, :string
  end

  def self.down
    drop_column :users, :user_name 
  end

end
