require 'csv'
class CommentsController < ApplicationController
  before_filter :sign_in_buyer
  
  def index
    @comments = Comment.all

    respond_to do |format|
      format.xls {
          send_data(xls_content_for(@comments),
                    :type => "text/excel; charset=utf-8;header=present",
                    :filename => "Comments_#{Time.now.strftime("%Y%m%d")}.xls")
      }
      format.csv {
          send_data(csv_content_for(@comments),
                    :type => "text/csv;charset=iso-8859-1;header=present",
                    :filename => "Comments_#{Time.now.strftime("%Y%m%d")}.csv")
      }
      format.html
    end
  end

  def new
  end

  def create
    current_buyer.orders.each do |order|
        @item = order.items.find_by_id(params[:comment][:item_id])
        if !@item.nil?
          break
        end
    end
    if !@item.nil?
        @product = Product.find_by_id(params[:comment][:product_id])
        if @item.commentable == false
            flash[:warning] = "You have already comment on this item!"
            redirect_to @product
        else
           @comment = Comment.new(params[:comment])
           if @comment.save
              flash[:success] = "Comment successfully!" 
              @item.update(commentable: false)
              redirect_to @product
           else
              flash[:warning] = "Comment faliure, please try again!"
           end
        end
    else
        flash[:warning] = "The item is not existed or doesn't belong to you!"
    end
  end

  def destroy
  end

  def show
  end

  private
      def xls_content_for(objs)
          xls_report = StringIO.new
        book = Spreadsheet::Workbook.new
        sheet1 = book.create_worksheet :name => "Comments"

        blue = Spreadsheet::Format.new :color => :blue, :weight => :bold, :size => 10
        #sheet1.row(0).concat %w{MusicID UserID Score}
        count_row = 1
        objs.each do |obj|
            sheet1[count_row, 0] = obj.product_id
            sheet1[count_row, 1] = obj.buyer_id
            sheet1[count_row, 2] = obj.score
            count_row += 1
        end

        book.write xls_report
        xls_report.string
      end

      def csv_content_for(objs)
          CSV.generate do |csv|
             #csv << ["SongID\t" "UserID\t" "Score\t"]
             objs.each do |record|
                  csv << ["#{record.buyer_id}\t" "#{record.product_id}\t" "#{record.score}\t"]
             end
          end
      end
end
