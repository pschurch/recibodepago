class Cambios < ActiveRecord::Migration
  def self.up
    change_table :remesas do |t| 
      t.text :test
    end
  end

  def self.down
    remove_column :remesas, :test
  end
end
