class Public::ClipArtistsController < Public::Base

	def create
		artist = Artist.find(params[:artist_id])
		if user_signed_in?
		clip = current_user.clip_artists.new(artist_id: artist.id)
		clip.save
		redirect_to artist_path(artist)
		return
		end
		redirect_to artist_path(artist), notice: "会員登録しよう！"
	end

	def destroy
		artist = Artist.find(params[:artist_id])
		clip = current_user.clip_artists.find_by(artist_id: params[:artist_id])
		clip.destroy
		redirect_to artist_path(artist)
	end

end
