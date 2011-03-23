class CreaNuevoReceipt < ActiveRecord::Migration
  def self.up
    create_table :receipts do |t|
      t.string :state, :default => "abierto"
      t.integer :payment_agreement_id
      t.integer :user_id
      t.integer :comuna_id
      t.string :payment_agreement_name
      t.date :date_r
      t.integer :total_pay
      t.integer :total_paid
      t.string :user_name
      t.string :telephone_user
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
      t.timestamps
    end
  end

  def self.down
    drop_table :receipts
  end
end
