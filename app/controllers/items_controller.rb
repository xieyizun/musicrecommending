class ItemsController < ApplicationController
  before_filter :sign_in_buyer

  def new
  end

  def create
    if create_order?
      @product = Product.find_by_id(params[:id])
      @item = Item.new(product_id:params[:id], order_id:current_order.id, product_name:@product.title, product_price:@product.price, commentable:true)
      if exisited_item(@item.product_id) or @item.save
        redirect_to @product.music_url
      else
        render new_item_path
      end
    end
  end

  def destroy
      current_order.items.find_by_id(params[:id]).destroy
      respond_to do |format|
          format.html {redirect_to current_order}
          format.js
      end
  end

  def show
    current_buyer.orders.each do |order|
        @item = order.items.find_by_id(params[:id])
        if !@item.nil?
            break
        end
    end
    if !@item.nil?
      @product = Product.find_by_id(@item.product_id)
      if !@product.nil?
        @comment = Comment.new(product_id:@product.id, buyer_id:current_buyer.id, item_id:params[:id])
      else
        flash[:warning] = "This song maybe has been deleted!"
        redirect_to current_buyer
      end
    else
      flash[:warning] = "The music item #{params[:id]} is not existed or doesn't belong to you!"
      redirect_to current_buyer
    end
  end

  def index
    redirect_to current_buyer
  end
end
