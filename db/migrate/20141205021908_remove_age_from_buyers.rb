class RemoveAgeFromBuyers < ActiveRecord::Migration
  def change
  	change_table :buyers do |t|
  		t.remove :age
  	end
  end
end
