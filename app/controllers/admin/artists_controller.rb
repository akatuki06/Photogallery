class Admin::ArtistsController < Admin::Base
  before_action :authenticate_admin!
  before_action :set_artist, except: [:index]

  def index
  	@artists = Artist.all.reverse_order
  	@artists.each do |artist|
	  	id = artist.id
	  	@line_items = LineItem.includes(work: :artist).where(artists: {id: [id] })
	  	@ordered_items =  @line_items.where.not(order_id: nil)
  	end
  end

  def show
  	id = @artist.id
  	@line_items = LineItem.includes(work: :artist).where(artists: {id: [id] })
  	@ordered_items =  @line_items.where.not(order_id: nil)
  end

  def edit
  end

  def update
  		@artist.update(is_deleted: !@artist.is_deleted?)
  		redirect_to admin_artist_path(@artist), notice: "更新しました"
  end

  private

  def set_artist
  	@artist = Artist.find(params[:id])
  end

  def artist_params
  	params.require(:artist).permit(:is_destroy)
  end
end
