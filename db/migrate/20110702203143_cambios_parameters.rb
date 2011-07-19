class CambiosParameters < ActiveRecord::Migration
  def self.up
    change_table :parameters do |t| 
      t.change :val_dec, :decimal, :precision => 5, :scale => 2
      t.text :help
    end
  end

  def self.down
    remove_column :parameters, :help
  end
end
