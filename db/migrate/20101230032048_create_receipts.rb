class CreateReceipts < ActiveRecord::Migration
  def self.up
    create_table :receipts do |t|
      t.string :state, :default => "abierto"
      t.integer :payment_agreement_id
      t.integer :user_id
      t.integer :contact_id
      t.string :payment_agreement
      t.date :date_r
      t.integer :total_pay
      t.integer :total_paid
      t.string :user_name
      t.string :telephone_user

      t.timestamps
    end
  end

  def self.down
    drop_table :receipts
  end
end
