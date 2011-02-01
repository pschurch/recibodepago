class CambiosTicket < ActiveRecord::Migration
  def self.up
    change_table :tickets do |t| 	
       t.integer :assignment_id  
    end
  end

  def self.down
    remove_column :tickets, :assignment_id
  end
end
