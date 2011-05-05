class CreatePaymentFormsPaymentPolicies < ActiveRecord::Migration
  def self.up
    create_table :payment_forms_payment_policies, :id => false do |t|
      t.references :payment_form
      t.references :payment_policy
      t.timestamps
    end
  end

  def self.down
    drop_table :payment_forms_payment_policies
  end
end
