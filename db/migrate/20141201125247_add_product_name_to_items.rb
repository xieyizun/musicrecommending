class AddProductNameToItems < ActiveRecord::Migration
  def change
    add_column :items, :product_name, :string
  end
end
