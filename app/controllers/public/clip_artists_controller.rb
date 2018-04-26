class Public::ClipArtistsController < Public::Base

	def create
		@artist = Artist.find(params[:artist_id])
		clip = current_user.clip_artists.new(artist_id: @artist.id)
		clip.save
	end

	def destroy
		@artist = Artist.find(params[:artist_id])
		clip = current_user.clip_artists.find_by(artist_id: params[:artist_id])
		clip.destroy
	end

end
