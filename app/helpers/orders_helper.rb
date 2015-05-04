module OrdersHelper

	def create_order(order)
		cookies.permanent[:remember_token2] = order.remember_token2
		self.current_order = order
	end

	def create_order?
		return !current_order.nil?
	end

	def current_order=(order)
		@current_order = order
	end

	def current_order
		@current_order ||= Order.find_by_remember_token2(cookies[:remember_token2])
	end

	def delete_order
		self.current_order = nil
		cookies.delete(:remember_token2)
	end
	
	def cal_totalcost
        if create_order?
          self.current_order.total_cost = self.current_order.items.sum(:product_price)
        end
    end
	
	def store_url
		session[:return_to] = request.fullpath
	end

	def redirect_back_or_to (default)
		redirect_to session[:return_to] || default
		session.delete(:return_to)
	end 

	def exisited_item(product_id)
		current_buyer.orders.each do |order|
			order.items.each do |item|
				if item.product_id == product_id
					return true
				end
			end
		end
		return false
	end
end
