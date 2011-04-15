class CreatePaymentForms < ActiveRecord::Migration
  def self.up
    create_table :payment_forms do |t|
      t.string :name
      t.text :description
      t.boolean :state, :default => true
      t.boolean :emitter, :default => false 
      t.boolean :num_doc, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :payment_forms
  end
end
