class Public::SalesController < Public::Base

	before_action :authenticate_user!, except: [:index, :show]
	before_action :artist_user

  def index
  	id = current_user.artist.id
  	@line_items = LineItem.includes(work: :artist).where(artists: {id: [id] })
  	@ordered_items =  @line_items.where.not(order_id: nil).page(params[:page]).per(10).reverse_order
  end

  private

  def artist_user
  	redirect_to root_path unless current_user.is_artist?
  end

end
