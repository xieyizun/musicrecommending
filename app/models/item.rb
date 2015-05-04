class Item < ActiveRecord::Base
	attr_accessible :product_id, :order_id, :product_name, :product_price, :commentable
	belongs_to :product
	belongs_to :order
	has_one :comment
end
