class CreateFieldUsers < ActiveRecord::Migration
  def self.up
    create_table :field_users do |t|
      t.string :rut
      t.string :digit
      t.string :name
      t.text :description
      t.boolean :state, :default => true
      t.timestamps
    end
  end

  def self.down
    drop_table :field_users
  end
end
