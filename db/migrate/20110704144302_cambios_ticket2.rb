class CambiosTicket2 < ActiveRecord::Migration
  def self.up
    change_table :tickets do |t| 
      t.decimal :int_mora, :decimal, :precision => 5, :scale => 2
      t.decimal :int_plazo, :decimal, :precision => 5, :scale => 2
      t.integer :profile_create
    end
  end

  def self.down
    remove_column :tickets, :int_mora, :int_plazo, :profile_create
  end
end
