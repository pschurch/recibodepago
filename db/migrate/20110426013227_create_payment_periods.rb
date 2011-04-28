class CreatePaymentPeriods < ActiveRecord::Migration
  def self.up
    create_table :payment_periods do |t|
      t.string :name
      t.text :description
      t.boolean :state, :default => true
      t.timestamps
    end
  end

  def self.down
    drop_table :payment_periods
  end
end
