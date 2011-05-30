class CreateCancellations < ActiveRecord::Migration
  def self.up
    create_table :cancellations do |t|
      t.text :message
      t.text :description
      t.boolean :state, :default => true
      t.timestamps
    end
  end

  def self.down
    drop_table :cancellations
  end
end
