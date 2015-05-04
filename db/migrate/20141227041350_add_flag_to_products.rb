class AddFlagToProducts < ActiveRecord::Migration
  def change
    add_column :products, :flag, :string
  end
end
