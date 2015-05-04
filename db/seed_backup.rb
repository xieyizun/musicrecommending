# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#...

#attention please: when producing test data, plese produce buyer first and change the buyer_id in orders by looking at the sqlite database firstly
#then produce the Order and then change the Items order_id and buyer_id accordingly and produce items and comments test data

Buyer.delete_all
Order.delete_all
Item.delete_all
Comment.delete_all

Buyer.create(name: "A", email: "1@qq.com", password: "111111", password_confirmation: "111111")
Buyer.create(name: "B", email: "2@qq.com", password: "222222", password_confirmation: "222222")
Buyer.create(name: "C", email: "3@qq.com", password: "333333", password_confirmation: "333333")
Buyer.create(name: "D", email: "4@qq.com", password: "444444", password_confirmation: "444444")
Buyer.create(name: "E", email: "5@qq.com", password: "555555", password_confirmation: "555555")

Order.create(buyer_id: 16, status: "Added") #A
Order.create(buyer_id: 17, status: "Added") #B
Order.create(buyer_id: 18, status: "Added") #C
Order.create(buyer_id: 19, status: "Added") #D
Order.create(buyer_id: 20, status: "Added") #E

#A
Item.create(product_id: 3653, order_id: 342, product_name:"singer1_song_1", commentable:false)
Item.create(product_id: 3656, order_id: 342, product_name:"singer1_song_2", commentable:false)
Item.create(product_id: 3659, order_id: 342, product_name:"singer1_song_3", commentable:false)
Item.create(product_id: 3662, order_id: 342, product_name:"singer1_song_4", commentable:false)
Item.create(product_id: 3665, order_id: 342, product_name:"singer1_song_5", commentable:false)
Item.create(product_id: 3668, order_id: 342, product_name:"singer1_song_6", commentable:false)

Comment.create(product_id: 3653, buyer_id: 16, score: 5)
Comment.create(product_id: 3656, buyer_id: 16, score: 4)
Comment.create(product_id: 3659, buyer_id: 16, score: 4)
Comment.create(product_id: 3662, buyer_id: 16, score: 4)
Comment.create(product_id: 3665, buyer_id: 16, score: 4)
Comment.create(product_id: 3668, buyer_id: 16, score: 5)

#B
Item.create(product_id: 3653, order_id: 343, product_name:"singer1_song_1", commentable:false)
Item.create(product_id: 3656, order_id: 343, product_name:"singer1_song_2", commentable:false)
Item.create(product_id: 3659, order_id: 343, product_name:"singer1_song_3", commentable:false)
Item.create(product_id: 3662, order_id: 343, product_name:"singer1_song_4", commentable:false)
Item.create(product_id: 3665, order_id: 343, product_name:"singer1_song_5", commentable:false)
Item.create(product_id: 3668, order_id: 343, product_name:"singer1_song_6", commentable:false)

Comment.create(product_id: 3653, buyer_id: 17, score: 4)
Comment.create(product_id: 3656, buyer_id: 17, score: 5)
Comment.create(product_id: 3659, buyer_id: 17, score: 4)
Comment.create(product_id: 3662, buyer_id: 17, score: 5)
Comment.create(product_id: 3665, buyer_id: 17, score: 4)
Comment.create(product_id: 3668, buyer_id: 17, score: 5)

#C
Item.create(product_id: 3653, order_id: 344, product_name:"singer1_song_1", commentable:false)
Item.create(product_id: 3656, order_id: 344, product_name:"singer1_song_2", commentable:false)
Item.create(product_id: 3659, order_id: 344, product_name:"singer1_song_3", commentable:false)
Item.create(product_id: 3662, order_id: 344, product_name:"singer1_song_4", commentable:false)
Item.create(product_id: 3665, order_id: 344, product_name:"singer1_song_5", commentable:false)
Item.create(product_id: 3668, order_id: 344, product_name:"singer1_song_6", commentable:false)

Comment.create(product_id: 3653, buyer_id: 18, score: 2)
Comment.create(product_id: 3656, buyer_id: 18, score: 1)
Comment.create(product_id: 3659, buyer_id: 18, score: 1)
Comment.create(product_id: 3662, buyer_id: 18, score: 2)
Comment.create(product_id: 3665, buyer_id: 18, score: 1)
Comment.create(product_id: 3668, buyer_id: 18, score: 1)

#D
Item.create(product_id: 3653, order_id: 345, product_name:"singer1_song_1", commentable:false)
Item.create(product_id: 3656, order_id: 345, product_name:"singer1_song_2", commentable:false)
Item.create(product_id: 3659, order_id: 345, product_name:"singer1_song_3", commentable:false)
Item.create(product_id: 3662, order_id: 345, product_name:"singer1_song_4", commentable:false)
Item.create(product_id: 3665, order_id: 345, product_name:"singer1_song_5", commentable:false)
Item.create(product_id: 3668, order_id: 345, product_name:"singer1_song_6", commentable:false)

Comment.create(product_id: 3653, buyer_id: 19, score: 1)
Comment.create(product_id: 3656, buyer_id: 19, score: 1)
Comment.create(product_id: 3659, buyer_id: 19, score: 2)
Comment.create(product_id: 3662, buyer_id: 19, score: 3)
Comment.create(product_id: 3665, buyer_id: 19, score: 2)
Comment.create(product_id: 3668, buyer_id: 19, score: 1)

#E
Item.create(product_id: 3653, order_id: 346, product_name:"singer1_song_1", commentable:false)
Item.create(product_id: 3656, order_id: 346, product_name:"singer1_song_2", commentable:false)
Item.create(product_id: 3659, order_id: 346, product_name:"singer1_song_3", commentable:false)
Item.create(product_id: 3662, order_id: 346, product_name:"singer1_song_4", commentable:false)
Item.create(product_id: 3665, order_id: 346, product_name:"singer1_song_5", commentable:false)
Item.create(product_id: 3668, order_id: 346, product_name:"singer1_song_6", commentable:false)

Comment.create(product_id: 3653, buyer_id: 20, score: 3)
Comment.create(product_id: 3656, buyer_id: 20, score: 1)
Comment.create(product_id: 3659, buyer_id: 20, score: 1)
Comment.create(product_id: 3662, buyer_id: 20, score: 3)
Comment.create(product_id: 3665, buyer_id: 20, score: 3)
Comment.create(product_id: 3668, buyer_id: 20, score: 1)


#the following data is to be returned when 16 is login and view songs, because 16, 17 is similar
30.times do |n|
	Item.create(product_id: rand(130) + 3670, order_id: 343, product_name:"user17_commented_song_#{n}", commentable:false)
	Comment.create(product_id: rand(130) + 3670, buyer_id: 17, score: rand(4)+3) #1,2,3,4,5
end

#the following data is to be returned when 18, 20 is login and view songs, because 18,19,20 is similar
30.times do |n|
	Item.create(product_id: rand(130) + 3670, order_id: 345, product_name:"user19_commented_song_#{n}", commentable:false)
	Comment.create(product_id: rand(130) + 3670, buyer_id: 19, score: rand(4)+3) #1,2,3,4,5
end
