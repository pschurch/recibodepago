class CreateRejectionTypes < ActiveRecord::Migration
  def self.up
    create_table :rejection_types do |t|
      t.string :name
      t.text :description
      t.boolean :state, :default => true
      t.timestamps
    end
  end

  def self.down
    drop_table :rejection_types
  end
end
