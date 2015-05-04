class AddGravatorUrlToBuyers < ActiveRecord::Migration
  def change
    add_column :buyers, :gravator_url, :string
  end
end
