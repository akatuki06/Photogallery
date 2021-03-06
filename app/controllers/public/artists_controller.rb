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
    	redirect_to artist_path(@artist), notice: "アーティスト登録が完了しました"
      else
        render :new
      end
  end

  def index
    @search = Artist.ransack(params[:q])
    @artists = @search.result.where(:is_deleted => false).page(params[:page]).reverse_order

    # @s = Post.ransack(params[:q])  
    # @s.sorts = ['name asc', 'created_at desc'] if @s.sorts.empty?
    # @posts = @search.result.paginate(page: params[:page], per_page: 20)
  end

  def show
    @artist = Artist.find(params[:id])
    @works = Work.all
    # @works = Work.where(artist_id: params[:id])あとで
  end

  def edit
  	if current_user.is_artist == true
  		@artist = Artist.find_by(user_id: current_user)
  	else
  		redirect_to new_artists_path, notice: "アーティスト登録をしてください"
  	end
  end

  def update
  	@artist = Artist.find_by(user_id: current_user)
  	if @artist.update(artist_params)
  	redirect_to artist_path(@artist), notice: "アーティスト情報を編集しました"
  else
    render :edit
  end
  end

  private
  	def artist_params
  	  params.require(:artist).permit(:user_id, :name, :url, :group, :career, :message)
  	end

end
