class AddPasswordDigestToBuyers < ActiveRecord::Migration
  def change
    add_column :buyers, :password_digest, :string
  end
end
