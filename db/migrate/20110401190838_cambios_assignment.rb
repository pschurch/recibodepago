class CambiosAssignment < ActiveRecord::Migration
  def self.up
    change_table :assignments do |t| 	
       t.integer :ticket_id 
       t.integer :receipt_id 
    end
  end

  def self.down
      remove_column :assignments, :ticket_id, :receipt_id
  end
end

