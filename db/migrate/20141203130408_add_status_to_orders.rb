class AddStatusToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :status, :string
    add_index :orders, :status
  end
end
