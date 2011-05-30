class CambiosReceipt < ActiveRecord::Migration
  def self.up
    change_table :receipts do |t| 
      t.change :state, :string, :default => ""	
      t.string :button
      t.integer :cancellation_id
      t.string :canc_solc_by
      t.integer :rejection_type_id
      t.integer :principal_id
      t.integer :product_id
      t.integer :adjust_val
      t.string :adjust_ticket
      t.text :adjust_obs
      t.integer :profile
    end 
  end

  def self.down
      remove_column :receipts, :button, :cancellation_id, :canc_solc_by, :rejection_type_id, :principal_id, 
                    :product_id, :adjust_val, :adjust_ticket, :adjust_obs, :profile
  end
end
