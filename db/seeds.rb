100.times do |n|
	Item.create(product_id: rand(130) + 3670, order_id: 578, product_name:"user235_commented_song_#{n}", commentable:false)
	Comment.create(product_id: rand(130) + 3670, buyer_id: 235, score: rand(3)+3) #1,2,3,4,5

	Item.create(product_id: rand(130) + 3670, order_id: 466, product_name:"user123_commented_song_#{n}", commentable:false)
	Comment.create(product_id: rand(130) + 3670, buyer_id: 123, score: rand(4)+2) #1,2,3,4,5

	Item.create(product_id: rand(130) + 3670, order_id: 498, product_name:"user155_commented_song_#{n}", commentable:false)
	Comment.create(product_id: rand(130) + 3670, buyer_id: 155, score: rand(4)+2) #1,2,3,4,5

	Item.create(product_id: rand(130) + 3670, order_id: 1098, product_name:"user755_commented_song_#{n}", commentable:false)
	Comment.create(product_id: rand(130) + 3670, buyer_id: 755, score: rand(3)+3) #1,2,3,4,5
end