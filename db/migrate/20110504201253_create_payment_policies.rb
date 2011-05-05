class CreatePaymentPolicies < ActiveRecord::Migration
  def self.up
    create_table :payment_policies do |t|
      t.integer :principal_id
      t.integer :product_id
      t.integer :collection_type_id
      t.integer :arrear_interest
      t.integer :term_interest
      t.integer :fee
      t.text :description
      t.boolean :state, :default => true
      t.boolean :legal_costs, :default => false
      t.boolean :installment, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :payment_policies
  end

end
