class StaticPagesController < ApplicationController
	def home
		@products = Product.paginate(page: params[:page], :per_page => 16)

		@goodsongs = []

		session.delete(:return_to)
		@product = Product.new

		#display the recommend songs you may like
		songs = []
		if sign_in?
			current_recommend_pool = fill_in_recommend_songs
			current_recommend_pool.each do |music_id|
					music = Product.find_by_id(music_id)
					songs << music
			end
		
			count = 0
			total = songs.count
			while total > 10 and count < 10 
				index = rand(total)
				ok = true

				@goodsongs.each do |song|
					if song == songs[index]
						ok = false
						break
					end
				end
			
				if ok == true
					@goodsongs << songs[index]
					count += 1
				end
			end
		end
	end

  private 
    #when a user sign in, create a pool of recommended songs that he may like,
	#which are deal with by the offline method.
	def fill_in_recommend_songs
		songs_pool = []
		count = 0
		users_songs = IO.readlines("/home/xieyizun/ai/music/app/assets/recommend/offline") 
		users_songs.each do |line|
			user_song = line.split(' ')
			if user_song.first.to_i == current_buyer.id and count <= 100
				songs_pool << user_song.last.to_i
				count += 1
				if count > 100
				   break
				end		
			end
		end
		return songs_pool
	end	
end
