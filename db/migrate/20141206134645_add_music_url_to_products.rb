class AddMusicUrlToProducts < ActiveRecord::Migration
  def change
    add_column :products, :music_url, :string
    add_index :products, :music_url
  end
end
