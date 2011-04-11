class CambiosPaymentForm < ActiveRecord::Migration
  def self.up
    change_table :payment_forms do |t| 	
       t.boolean :emitter, :default => false 
       t.boolean :num_doc, :default => false
    end
  end

  def self.down
      remove_column :payment_forms, :emitter, :num_doc
  end
end

