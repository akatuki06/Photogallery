class Public::WorksController < Public::Base
	before_action :authenticate_user!, except: [:index, :show]
	before_action :artist_user, except: [:index, :show]
  before_action :ensure_correct_artist, only: [:edit, :update, :soft_delete]


  def index
    @works = Work.all
  end

  def show
  	@work = Work.find(params[:id])
    @line_item = LineItem.new
  end

  def new
  	@work = Work.new
  end

  def create
  		@work = Work.new(work_params)
  		@work.artist_id = current_user.artist.id
  	if @work.save
  		redirect_to work_path(@work), notice: "作品登録が完了しました"
  	else
  		render :new
  	end
  end

  def edit
  end

  def update
    if @work.update(work_params)
      redirect_to work_path(@work.id), notice: "作品情報を編集しました"
    else
      render :edit
    end
  end

  def soft_delete
    @work.update(is_deleted: true)
    redirect_to artist_path(current_user.artist.id), notice: "作品を削除しました"
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

  def work_params
  	params.require(:work).permit(:title,
						  		:image,
						  		:price,
						  		:stock,
						  		:creation_date,
						  		:editionm,
						  		:size,
						  		:technique,
						  		:comment,
                  :tag_list
						  		)
  end
end
