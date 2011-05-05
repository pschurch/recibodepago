class CreateComunas < ActiveRecord::Migration
  def self.up
    create_table :comunas do |t|
      t.string :name
      t.boolean :state, :default => true
      t.timestamps
    end
  end

  def self.down
    drop_table :comunas
  end

end
