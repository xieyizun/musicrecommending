class AddProductPriceToItems < ActiveRecord::Migration
  def change
    add_column :items, :product_price, :decimal
  end
end
