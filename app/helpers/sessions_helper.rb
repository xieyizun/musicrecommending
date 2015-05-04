module SessionsHelper
	def sign_in(buyer)
		cookies.permanent[:remember_token] = buyer.remember_token
		self.current_buyer = buyer
	end

	def sign_in?
		return !current_buyer.nil?
	end

	def current_buyer=(buyer)
		@current_buyer = buyer
	end

	def current_buyer
		@current_buyer ||= Buyer.find_by_remember_token(cookies[:remember_token])
	end

	def sign_out
		self.current_buyer = nil
		cookies.delete(:remember_token)
	end

	def sign_in_buyer
		unless sign_in?
			redirect_to signin_path, notice: "please sign in first!"
		end
	end

	
	
end
