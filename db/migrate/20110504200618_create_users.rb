class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :user
      t.string :name
      t.string :telephone
      t.string :email
      t.text :description
      t.integer :profile_id
      t.integer :group_id
      t.boolean :state, :default => true
      t.string  :encrypted_password
      t.string :salt

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end 

end
