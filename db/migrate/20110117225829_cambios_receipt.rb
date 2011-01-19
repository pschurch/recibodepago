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
         t.rename :contact_id, :comuna_id
         t.string :cont_name
         t.string :cont_rut
         t.string :cont_digit
         t.string :cont_calle
         t.string :cont_num
         t.string :cont_depto
         t.string :cont_comuna
         t.string :cont_ref
         t.string :cont_hr  
         t.string :cont_telf1
         t.string :cont_telf2    
         t.string :cont_telf3
      end 
   end 

   def self.down 
      remove_column :receipts, :group_id, :et_name, :horario, :rc, :user_print, 
                    :date_print, :num_print, :canc_by, :canc_date, :rech_by,
                    :rech_mtvo, :rech_date, :pdf_by, :pdf_date,
                    :frs_mtvo, :date_tsrc, :cont_name, :cont_rut, :cont_digit, 
                    :cont_calle, :cont_num, :cont_depto, :cont_comuna, 
                    :cont_ref, :cont_telf1, :cont_telf2, :cont_telf3
   end 

end
