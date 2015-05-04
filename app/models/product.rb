class Product < ActiveRecord::Base
	attr_accessible :title, :description, :image_url, :price, :music_url, :flag
	has_many :items, dependent: :destroy
	has_many :comments, dependent: :destroy
end
