class CambiosTicket < ActiveRecord::Migration
  def self.up
    change_table :tickets do |t| 	
       t.integer :assignment_id 
       t.datetime :adjust_sup_time
       t.remove :adjust_sup_date, :adjust_sup_tm	
    end
  end

  def self.down
      remove_column :tickets, :assignment_id, :adjust_sup_time
  end

end
