class CambioReceipt < ActiveRecord::Migration
  def self.up
    change_table :receipts do |t| 	
      t.string :substate 
      t.string :area
    end
  end

  def self.down
    remove_column :receipts, :substate, :area 
  end
end
