class CambiosTicket < ActiveRecord::Migration
  def self.up
    change_table :tickets do |t| 
      t.change :capital, :integer, :default => "0"
      t.change :fee, :integer, :default => "0"
      t.change :arrear_interest, :integer, :default => "0"
      t.change :term_interest, :integer, :default => "0"
      t.change :shipping_costs, :integer, :default => "0"
      t.change :legal_costs, :integer, :default => "0"
      t.integer :adjust_val, :default => "0"
      t.integer :adjust_trr_val, :default => "0"
      t.text :adjust_trr_obs
      t.integer :profile
      t.remove :adjust_ejc_val, :adjust_sup_val, :adjust_mgt_val
    end
  end

  def self.down
    remove_column :tickets, :adjust_val, :adjust_trr_val, :adjust_trr_obs, :profile
  end
end
