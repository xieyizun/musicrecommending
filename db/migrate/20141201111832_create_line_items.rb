class CreateLineItems < ActiveRecord::Migration
  def change
  	drop_table :line_items
    create_table :line_items do |t|
      t.integer :product_id
      t.integer :order_id
      t.string :product_name
      t.decimal :product_cost

      t.timestamps
    end
  end
end
