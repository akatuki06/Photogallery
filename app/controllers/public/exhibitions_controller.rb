class Public::ExhibitionsController < Public::Base
  before_action :ensure_exhibitions, only: [:edit, :update, :destroy]

  def index
    @search = Exhibition.ransack(params[:q])
    @exhibitions = @search.result.page(params[:page]).reverse_order
  end

  def show
    @exhibition = Exhibition.find(params[:id])
  end

  def new
    @exhibition = Exhibition.new
    @exhibition.images.build
  end

  def edit
  end

  def create
  	@exhibition = Exhibition.new(exhibitions_params)
  	@exhibition.artist_id = current_user.artist.id
  	if @exhibition.save
  		redirect_to exhibition_path(@exhibition.id), notice: "登録が完了しました。"
  	else
  		render :new
  	end
  end

  def update
    if @exhibition.update(exhibitions_params)
      redirect_to exhibition_path(@exhibition.id), notice: "登録情報を編集しました"
    else
      render :edit
    end
  end

  def destroy
    @exhibition.destroy
    redirect_to artist_path(current_user.artist.id)
  end

  private
    def ensure_exhibitions
      @exhibition = Exhibition.find_by(artist_id: current_user.artist.id)
      if @exhibition.artist.id != current_user.artist.id
      redirect_to root_path, notice: '権限がありません'
      end
    end

    def exhibitions_params
      params.require(:exhibition).permit(:artist_id,
								            :title,
								            :summary,
								            :place,
								            :term,
								            :entrance_fee,
								            :closed_day,
								            :opneing_hour,
								            :information,
								            :url,
								            images_attributes: [:id, :image, :_destroy]
								            )
    end
end
