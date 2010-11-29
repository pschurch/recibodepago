class AddUserUniquenessIndex < ActiveRecord::Migration
  def self.up
    add_index :users, :user, :unique => true
  end

  def self.down
    remove_index :users, :user
  end
end
