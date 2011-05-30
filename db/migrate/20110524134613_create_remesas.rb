class CreateRemesas < ActiveRecord::Migration
  def self.up
    create_table :remesas do |t|
      t.string :state
      t.integer :principal_id
      t.integer :product_id
      t.string :principal_rs
      t.string :create_by
      t.datetime :date_rem
      t.string :rc_by
      t.datetime :date_rc
      t.timestamps
    end
  end

  def self.down
    drop_table :remesas
  end
end
