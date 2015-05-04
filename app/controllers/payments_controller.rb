class PaymentsController < ApplicationController

  before_filter :sign_in_buyer
  before_filter :order_empty?, :cal_totalcost, only: [:new, :create]

  def new
  end

  def create
  	if create_order?
      if current_order.update_attribute(:status, "Added")
        flash[:success] = "Song list #{current_order.id} is added successfully!"
  		  delete_order
  		  redirect_to current_buyer
      else
        flash[:warning] = "Add failure"
        redirect_to current_order
      end
  	else
  		flash[:error] = "All song lists have been added to my music!"
  		redirect_to current_buyer
  	end
  end

  private 
    def order_empty?
      if create_order? and current_order.items.count == 0
        flash[:notice] = "Current Song list is empty!"
        redirect_to current_order
      end
    end
end
