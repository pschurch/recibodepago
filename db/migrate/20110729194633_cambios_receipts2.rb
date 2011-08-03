class CambiosReceipts2 < ActiveRecord::Migration
  def self.up
    change_table :receipts do |t| 
      t.integer :profile_create
    end 
  end

  def self.down
      remove_column :receipts, :profile_create
  end
end
