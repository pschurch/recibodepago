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
         t.string :formapago1
         t.string :formapago2
         t.string :formapago3
         t.string :formapago4
         t.string :formapago5
         t.string :formapago6
         t.string :emisor1
         t.string :emisor2         
         t.string :emisor3         
         t.string :emisor4
         t.string :emisor5
         t.string :emisor6
         t.string :docnum1
         t.string :docnum2
         t.string :docnum3
         t.string :docnum4
         t.string :docnum5
         t.string :docnum6
         t.integer :monto1
         t.integer :monto2
         t.integer :monto3
         t.integer :monto4
         t.integer :monto5
         t.integer :monto6
      end 
   end 

   def self.down 
      remove_column :receipts, :group_id, :et_name, :horario, :rc, :user_print, 
                    :date_print, :num_print, :canc_by, :canc_date, :rech_by,
                    :rech_mtvo, :rech_date, :pdf_by, :pdf_date,
                    :frs_mtvo, :date_tsrc, :cont_name, :cont_rut, :cont_digit, 
                    :cont_calle, :cont_num, :cont_depto, :cont_comuna, 
                    :cont_ref, :cont_telf1, :cont_telf2, :cont_telf3,
                    :formapago1, :formapago2, :formapago3, :formapago4, 
                    :formapago5, :formapago6, :emisor1, :emisor2, :emisor3, 
                    :emisor4, :emisor5, :emisor6, :docnum1, :docnum2, :docnum3, 
                    :docnum4, :docnum5, :docnum6, :monto1, :monto2, :monto3, 
                    :monto4, :monto5, :monto6
   end 

end
