class AddIndexToBuyersRememberToken < ActiveRecord::Migration
  def change
  	add_index :buyers, :remember_token
  end
end
