class Admin::ArtistsController < Admin::Base
  before_action :authenticate_admin!
  before_action :set_artist, except: [:index]

  def index
  	@search = Artist.ransack(params[:q])
    @artists = @search.result.page(params[:page]).reverse_order
  end

  def show
  	id = @artist.id
  	@line_items = LineItem.includes(work: :artist).where(artists: {id: [id] })
  	@ordered_items =  @line_items.where.not(order_id: nil).page(params[:page]).reverse_order
  end

  def edit
  end

  def update
  		@artist.update(is_deleted: !@artist.is_deleted?)
      if @artist.works.present?
      @artist.works.all.update(is_deleted: true)
        if @artist.exhibition.present?
        @artist.exhibition.destroy
        end
      end
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
