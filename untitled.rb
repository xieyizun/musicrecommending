class Order < ActiveRecord::Base
	attr_accessible :products_id
	validates :buyer_id, presence: true
	validates :products_id, presence: true 

	before_save :create_remember_token

	private 
		def create_remember_token
			self.remember_token = SecureRandom.urlsafe_base64
		end
end

module OrdersHelper
	def create_order(order)
		cookies.permanent[:remember_token] = order.remember_token
		self.current_order = order
	end

	def create_order?
		return !current_order.nil
	end

	def current_order=(order)
		@current_order = order
	end

	def current_order
		@current_order ||= Order.find_by_remember_token[:remember_token]
	end

	def delete_order
		self.current_order = nil
		cookies.delete(:remember_token)
end
