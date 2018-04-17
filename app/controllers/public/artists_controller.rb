class Public::ArtistsController <  Public::Base
  def new
  	if current_user.is_artist == false
  	   @artist = Artist.new
  	else
  	   redirect_to root_path
  	end
  end

  def create
  	artist = Artist.new(artist_params)
  	artist.user_id = current_user.id
  		# binding.pry
  		
  	if artist.save
  	  user = current_user
  	user.update(is_artist: true)
  	redirect_to edit_artists_path(artist)
      else
        redirect_to root_path
      end
  end

  def index
  end

  def show
  end

  def edit
  	if current_user.is_artist == true
  		@artist = Artist.find_by(user_id: current_user)
  	else
  		redirect_to new_artists_path
  	end
  end

  def update
  	current_user.is_artist == true
  	artist = Artist.find_by(user_id: current_user)
  	artist.update(artist_params)
  	redirect_to edit_artists_path(artist)
  end

  private
  	def artist_params
  	  params.require(:artist).permit(:user_id, :name, :url, :group, :career, :message)
  	end

end
