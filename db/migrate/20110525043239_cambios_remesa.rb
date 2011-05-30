class CambiosRemesa < ActiveRecord::Migration
  def self.up
    change_table :remesas do |t| 
      t.remove :date_rem
      t.string :product_name
    end
  end

  def self.down
    remove_column :remesas, :product_name
  end
end
