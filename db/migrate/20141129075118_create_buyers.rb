class CreateBuyers < ActiveRecord::Migration
  def self.up
    drop_table :buyers
    create_table :buyers do |t|
      t.string :name
      t.string :favor
      t.integer :sex
      t.integer :age
      t.string :email
      t.string :password
      t.string :password_confirmation

      t.timestamps
    end
  end

  def self.down
    drop_table
  end
end
