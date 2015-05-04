class BuyersController < ApplicationController
  before_filter :sign_in_buyer, only: [:edit, :update, :show]
  before_filter :correct_buyer, only: [:edit, :update, :show]
  
  def new
    if sign_in?
      flash[:warning] = "You have already sign in!"
      redirect_to current_buyer
    else
      @buyer = Buyer.new
    end
  end

  def create
      params.permit!
      @buyer = Buyer.new(params[:buyer])

      if @buyer.save
        flash[:success] = "register successfully!"
        sign_in @buyer
        redirect_to current_buyer
      else
        render new_buyer_path
      end
  end

  def edit
  end

  def update
      if @buyer.update_attributes(params[:buyer])
        flash[:success] = "Udate Your Profile Successfully!"
        sign_in @buyer
        redirect_to current_buyer
      else
        flash[:warning] = "Update Failure!"
        redirect_to edit_buyer_path
      end
  end

  def show
    @orders = current_buyer.orders.paginate(page: params[:page])
  end

  def index
  end

  def destroy
  end

  private
    def correct_buyer
      @buyer = Buyer.find_by_id(params[:id])
      unless !@buyer.nil? and @buyer.id == current_buyer.id
        flash[:warning] = "You have no right to view other buyer's profile!"
        redirect_to current_buyer
      end
    end
end
