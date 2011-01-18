class CambiosReceipt < ActiveRecord::Migration
   def self.up 
      change_table :receipts do |t| 	
         t.integer :group_id  
         t.string :et_name 
         t.string :horario
         t.boolean :rc
         t.string :user_print
         t.date :date_print
         t.integer :num_print
         t.string :canc_by 
         t.date :canc_date 
         t.string :rech_by
         t.string :rech_mtvo
         t.date :rech_date
         t.string :pdf_by
         t.date :pdf_date
         t.string :frs_mtvo
         t.date :date_tsrc
      end 
   end 

   def self.down 
      remove_column :receipts, :group_id, :et_name, :horario, :rc, :user_print, 
                    :date_print, :num_print, :canc_by, :canc_date, :rech_by,
                    :rech_mtvo, :rech_date, :pdf_by, :pdf_date,
                    :frs_mtvo, :date_tsrc
   end 

end
