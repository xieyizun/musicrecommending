require 'csv'

class Comment < ActiveRecord::Base
	attr_accessible :score, :buyer_id, :product_id, :item_id
	belongs_to :product
	belongs_to :buyer
	belongs_to :item

	def self.export_all
		File.open("/home/xyz/test.csv", 'wb') do |f|
			f << Comment.csv_content_for(Comment.all)
		end
	end

	def self.csv_content_for(objs)
          CSV.generate do |csv|
             objs.each do |record|
                  csv << ["#{record.product_id}\t" "#{record.buyer_id}\t" "#{record.score}\t"]
             end
          end
    end
end
