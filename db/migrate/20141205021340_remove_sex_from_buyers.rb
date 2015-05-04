class RemoveSexFromBuyers < ActiveRecord::Migration
  def change
  	change_table :buyers do |t|
  		t.remove :sex
  	end
  end
end
