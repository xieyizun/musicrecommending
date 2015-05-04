module ProductsHelper
	def recommend_songs(comments, song_flag)
		#get users that has commented on this song
		has_commented_userids = []
		comments.each do |comment|
			has_commented_userids << comment.buyer_id
		end
		has_commented_userids = has_commented_userids.uniq
		has_commented_userids.delete(current_buyer.id) #delete this to test that the similar degree with self is 1.0

		#get songs'score that each user has commented
		users_commented_songs = []
		has_commented_userids.each do |userid|
			user_comments = Comment.find_by_sql("select * from comments where buyer_id == #{userid}")
			user_songs_score = get_commented_songs(userid, user_comments)
			users_commented_songs << user_songs_score
		end
		current_user_comments = Comment.find_by_sql("select * from comments where buyer_id == #{current_buyer.id}")
		current_user_songs_score = get_commented_songs(current_buyer.id, current_user_comments)

		#find similar user
		toptens = []
		similar_users_order_by_dis = []
		users_commented_songs.each do |user_commented_songs|
			user_dis = {}
			user_commented_songs.each do |key, value| #only one time iteration
				user_dis[key] = compute_k_dis(current_user_songs_score[current_buyer.id], value) #use method  k_adjacent algorithm
				similar_users_order_by_dis << user_dis
			end		
		end

		similar_users_order_by_dis = similar_users_order_by_dis.sort_by {|user| user.values.first}
		similar_users_order_by_dis = similar_users_order_by_dis.reverse

		#recommend songs
		recommend_songs = []
		recommend_songs_count = 0
		songs = {}
		users_commented_songs.each do |user_commented_song|
			songs[user_commented_song.keys.first] = user_commented_song.values.first
		end

		similar_users_order_by_dis.each do |user|
			if user.values.first != 0.0	
				canditate_songs = songs[user.keys.first].shuffle
				canditate_songs.each do |song|
					if song.values.first >= 4.0
						recommend_songs << song.keys.first
						recommend_songs_count += 1
					end
					if recommend_songs_count >= 10
						break
					end
				end
				if recommend_songs_count >= 10
					break
				end
			end
		end

		#this is to deal with the case that there is not enough songs to recommend by 
		#listenners that has listened to this song and so we use the method of flag that
		#we recommend 10 songs with the same flag as this songs randomly
		is_k_method = true

		if recommend_songs_count < 10
			recommend_songs.clear
			recommend_songs = get_same_flag_songs(song_flag)
			is_k_method = false
		end

		return recommend_songs, is_k_method #, similar_users_order_by_dis
	end

	def get_commented_songs(userid, comments)
		user_songs_score = {}
		user_songs_score[userid] = []
		comments.each do |song|
			song_score = {}
			song_score[song.product_id] = song.score	
			user_songs_score[userid] << song_score
		end
		return user_songs_score
	end

	#realize k adjacents algorithm to calculate two users' similarity degree
	def compute_k_dis(current_user_songs, user_songs)
		dis = 0.0
		same_count = 0.0
		current_user_songs_count = current_user_songs.count
		user_songs_count = user_songs.count

		current_user_songs.each do |current_user_song|
			user_songs.each do |user_song|
				if current_user_song.keys.first == user_song.keys.first
					same_count += 1.0
					dis += (current_user_song.values.first - user_song.values.first) ** 2
					#delete this same song so as to make the remaind songs of this user is not listened
					#by current user
					user_songs.delete(user_song)
				end
			end
		end
		
		same_count += 1.0 #avoid divide by 0
		dis = Math.sqrt(dis/same_count) #improvement 1
		same_count -= 1.0
		 #make the similarity degree is between 0 to 1, where 1 means they are the same and 0 means they are totally different.
		dis = 1.0 - Math.tanh(dis)
		max_same = get_min(current_user_songs_count, user_songs_count) + 1.0 #add 1.0 to avoid the case that divide by 0

		return (same_count/max_same) * dis #improvement 2
	end

	def get_min(count1, count2)
		if count1 < count2
			return count1
		else
			return count2
		end
	end

	def is_commented_song(song_id)
		current_user_comments = Comment.find_by_sql("select * from comments where buyer_id == #{current_buyer.id}")
		current_user_comments.each do |current_user_comment|
			if current_user_comment.product_id == song_id
				return true
			end
		end
		return false
	end 

	def get_same_flag_songs(song_flag)
		recommend_songs = []
		same_flag_songs = Product.find_by_sql("select id from products where flag == '#{song_flag}'")
		same_flag_songs_count = same_flag_songs.count

		while recommend_songs.count < 10
			index = rand(same_flag_songs_count)		
			if !exisited_item(same_flag_songs[index].id) #avoid recommending the song that current user has already listened. 
				exisited = false
				recommend_songs.each do |song|
					if song == same_flag_songs[index].id #avoid recommending the two songs that are the same.
						exisited = true
						break
					end
				end
				if exisited == false
					recommend_songs << same_flag_songs[index].id
				end
			end
		end
		return recommend_songs
	end
end
