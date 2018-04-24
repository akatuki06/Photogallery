class Public::SalesController < Public::Base

	before_action :authenticate_user!, except: [:index, :show]
	before_action :artist_user, except: [:index, :show]
  	before_action :ensure_correct_artist, only: [:edit, :update, :soft_delete]

  def index
  	id = current_user.artist.id
  	@line_items = LineItem.includes(work: :artist).where(artists: {id: [id] })
  	@ordered_items =  @line_items.where.not(order_id: nil)
  end

  private

  def artist_user
  	redirect_to root_path unless current_user.is_artist?
  end

  def ensure_correct_artist
     @work = Work.find(params[:id])
    if @work.artist.user != current_user || @work.is_deleted == true
       redirect_to root_path, notice: "権限がありません"
      end
  end

end
