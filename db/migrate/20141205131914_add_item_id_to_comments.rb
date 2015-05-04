class AddItemIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :item_id, :integer
    add_index :comments, :item_id
  end
end
