class CreatePaymentForms < ActiveRecord::Migration
  def self.up
    create_table :payment_forms do |t|
      t.string :name
      t.boolean :emitter, :default => false 
      t.boolean :num_doc, :default => false
      t.text :description
      t.boolean :state, :default => true
      t.timestamps
    end
  end

  def self.down
    drop_table :payment_forms
  end

end
