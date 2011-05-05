class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.string :name
      t.text :description
      t.boolean :state, :default => true
      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end

end
