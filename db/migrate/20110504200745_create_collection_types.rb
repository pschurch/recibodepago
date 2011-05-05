class CreateCollectionTypes < ActiveRecord::Migration
  def self.up
    create_table :collection_types do |t|
      t.string :name
      t.text :description
      t.boolean :state, :default => true
      t.timestamps
    end
  end

  def self.down
    drop_table :collection_types
  end

end
