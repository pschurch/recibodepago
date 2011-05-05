class CreatePrincipals < ActiveRecord::Migration
  def self.up
    create_table :principals do |t|
      t.string :name
      t.string :social_reason
      t.string :rut
      t.string :digit
      t.string :contact
      t.string :telephone
      t.string :email
      t.boolean :state, :default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :principals
  end
end
