class CambiosRejection < ActiveRecord::Migration
  def self.up
    change_table :rejection_types do |t| 
      t.string :area
    end
  end

  def self.down
    remove_column :rejection_types, :area
  end
end
