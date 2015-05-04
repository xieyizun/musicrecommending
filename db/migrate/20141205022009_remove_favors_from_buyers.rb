class RemoveFavorsFromBuyers < ActiveRecord::Migration
  def change
  	change_table :buyers do |t|
  		t.remove :favors
  	end
  end
end
