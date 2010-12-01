class CreateAssignments < ActiveRecord::Migration
  def self.up
    create_table :assignments do |t|
      t.string :state
      t.string :cas_id
      t.integer :principal_id
      t.integer :collection_type_id
      t.integer :product_id
      t.string :name
      t.string :rut
      t.string :digit
      t.date :alloc_date
      t.integer :capital
      t.string :number
      t.string :emitter
      t.string :ctacte
      t.date :expir_date

      t.timestamps
    end
  end

  def self.down
    drop_table :assignments
  end
end
