class CreateTickets < ActiveRecord::Migration
  def self.up
    create_table :tickets do |t|
      t.integer :principal_id
      t.integer :collection_type_id
      t.integer :product_id
      t.integer :user_id
      t.integer :receipt_id
      t.string :state, :default => "creado"
      t.string :state_fees, :default => "sin_facturar"
      t.integer :group_id
      t.string :rut
      t.string :digit
      t.string :name
      t.string :cas_id
      t.string :principal_name
      t.string :collection_type_name
      t.text :payment_description
      t.integer :capital
      t.integer :arrear_interest
      t.integer :term_interest
      t.integer :fee
      t.integer :shipping_costs
      t.integer :legal_costs
      t.integer :total_pay
      t.string :product_name
      t.string :number
      t.string :emitter
      t.string :ctacte
      t.date :expir_date
      t.string :ballot
      t.string :quota_num
      t.string :total_q
      t.string :prepared_by
      t.boolean :doc_delivery
      t.boolean :adjust_sup
      t.text :adjust_sup_des
      t.date :adjust_sup_date
      t.time :adjust_sup_tm
      t.boolean :adjust_mgt
      t.text :adjust_mgt_des
      t.date :adjust_mgt_date
      t.time :adjust_mgt_tm
      t.string :canceled_by
      t.date :canceled_date

      t.timestamps
    end
  end

  def self.down
    drop_table :tickets
  end
end
