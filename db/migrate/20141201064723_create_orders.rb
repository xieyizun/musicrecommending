class CreateOrders < ActiveRecord::Migration
  def self.up
    drop_table :orders
    create_table :orders do |t|
      t.integer :buyer_id
      t.string :remember_token2

      t.timestamps
    end
  end
  def self.down
  	drop_table
  end
end
