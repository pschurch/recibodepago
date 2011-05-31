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
      t.integer :profile
      t.integer :pay_period_at
      t.integer :pay_period_no
      t.integer :pay_period_ad
      t.integer :ad_capital, :default => "0"
      t.integer :ad_arrear_interest, :default => "0"
      t.integer :ad_term_interest, :default => "0"
      t.integer :ad_fee, :default => "0"
      t.integer :ad_shipping_costs, :default => "0"
      t.integer :ad_legal_costs, :default => "0"
      t.remove :adjust_ejc_val, :adjust_sup_val, :adjust_mgt_val, :pay_period
    end
  end

  def self.down
    remove_column :tickets, :adjust_val, :profile, :pay_period_at,
:pay_period_no, :pay_period_ad, :ad_capital, :ad_arrear_interest, :ad_term_interest, :ad_fee,
:ad_shipping_costs, :ad_legal_costs
  end
end
