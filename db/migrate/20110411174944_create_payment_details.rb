class CreatePaymentDetails < ActiveRecord::Migration
  def self.up
    create_table :payment_details do |t|
      t.integer :receipt_id
      t.string :payment_form
      t.string :emitter
      t.string :doc_num
      t.integer :amount
      t.timestamps
    end
  end

  def self.down
    drop_table :payment_details
  end
end
