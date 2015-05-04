class CreateItems < ActiveRecord::Migration
  def change
  	drop_table :items
    create_table :items do |t|
      t.integer :product_id
      t.integer :order_id

      t.timestamps
    end
  end
end
