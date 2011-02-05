class CambiosTicket < ActiveRecord::Migration
  def self.up
    change_table :tickets do |t| 	
       t.integer :assignment_id 
       t.datetime :adjust_sup_time
       t.remove :adjust_sup_date, :adjust_sup_tm
       t.datetime :adjust_mgt_time
       t.remove :adjust_mgt_date, :adjust_mgt_tm
       t.remove :canceled_date
       t.datetime :canceled_time
       t.integer :adjust
       t.datetime  :adjust_time
       t.string :adjust_by
       t.text :adjust_obs
       t.integer :new_total_pay	
    end
  end

  def self.down
      remove_column :tickets, :assignment_id, :adjust_sup_time, 
        :adjust_mgt_time, :canceled_time,
        :adjust, :adjust_time, :adjust_by, :adjust_obs, :new_total_pay
  end

end
