class Public::ArtistsController <  Public::Base
	before_action :authenticate_user!, except: [:index, :show]

  def new
  	if current_user.is_artist == false
  	   @artist = Artist.new
  	else
  	   redirect_to root_path
  	end
  end

  def create
    	@artist = Artist.new(artist_params)
    	@artist.user_id = current_user.id
    if @artist.save
    	user = current_user
    	user.update(is_artist: true)
    	redirect_to artist_path(@artist)
      else
        render :new
      end
  end

  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
    # @works = Work.where(artist_id: params[:id])あとで
  end

  def edit
  	if current_user.is_artist == true
  		@artist = Artist.find_by(user_id: current_user)
  	else
  		redirect_to new_artists_path
  	end
  end

  def update
  	@artist = Artist.find_by(user_id: current_user)
  	if @artist.update(artist_params)
  	redirect_to artist_path(@artist)
  else
    render :edit
  end
  end

  private
  	def artist_params
  	  params.require(:artist).permit(:user_id, :name, :url, :group, :career, :message)
  	end

end
