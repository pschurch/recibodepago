class CreateCarteras < ActiveRecord::Migration
  def self.up
    create_table :carteras do |t|
      t.integer :principal_id
      t.integer :product_id
      t.boolean :state, :default => true
      t.timestamps
    end
    add_index :carteras, :principal_id
    add_index :carteras, :product_id
  end

  def self.down
    drop_table :carteras
  end

end
