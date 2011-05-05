class CreateCargrups < ActiveRecord::Migration
  def self.up
    create_table :cargrups do |t|
      t.integer :group_id
      t.integer :cartera_id
      t.timestamps
    end
    add_index :cargrups, :group_id
    add_index :cargrups, :cartera_id
  end

  def self.down
    drop_table :cargrups
  end

end
