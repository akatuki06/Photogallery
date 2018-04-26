class Public::ClipArtistsController < Public::Base

	def create

		# @like = Clip_artist.create(user_id: current_user.id, artist_id: params[:artist_id])
		# @artist = Artist.find(params[:id])
		@artist = Artist.find(params[:artist_id])
		if user_signed_in?
		clip = current_user.clip_artists.new(artist_id: @artist.id)
		clip.save
		# redirect_to artist_path(@artist)
		# return
		end
		# redirect_to artist_path(artist), notice: "会員登録しよう！"
	end

	def destroy
		# like = Clip_artist.find_by(user_id: current_user.id, artist_id: params[:artist_id])
		# like.destroy
		@artist = Artist.find(params[:artist_id])
		clip = current_user.clip_artists.find_by(artist_id: params[:artist_id])
		clip.destroy
		# redirect_to artist_path(artist)
	end

end
