class CreateEmitters < ActiveRecord::Migration
  def self.up
    create_table :emitters do |t|
      t.string :name
      t.text :description
      t.boolean :state, :default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :emitters
  end
end
