class CreateComments < ActiveRecord::Migration
  def self.up
    drop_table :comments
    create_table :comments do |t|
      t.integer :product_id
      t.integer :buyer_id
      t.decimal :score

      t.timestamps
    end
  end

  def self.down
  	drop_table
  end
end
