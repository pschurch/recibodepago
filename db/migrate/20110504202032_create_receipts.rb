class CreateReceipts < ActiveRecord::Migration
  def self.up
    create_table :receipts do |t|
      t.string :state, :default => "abierto"
      t.string :area
      t.string :subarea 
      t.integer :payment_flow_id
      t.integer :payment_agreement_id
      t.integer :remesa_id
      t.string :payment_agreement_name
      t.datetime :date_r
      t.integer :total_pay
      t.integer :total_paid
      t.string :user_name
      t.string :telephone_user
      t.integer :group_id  
      t.string :et_name 
      t.string :horario
      t.boolean :rc
      t.string :canc_by 
      t.datetime :canc_date
      t.text :canc_mtvo 
      t.string :rech_by
      t.text :rech_mtvo
      t.datetime :rech_date
      t.string :pdf_by
      t.datetime :pdf_date
      t.text :frs_mtvo
      t.datetime :tsrc_date
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
      t.timestamps
   end
  end

  def self.down
    drop_table :receipts
  end

end
