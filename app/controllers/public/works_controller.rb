class Public::WorksController < Public::Base
	before_action :authenticate_user!, except: [:index, :show]
	before_action :artist_user, except: [:index, :show]


  def index
    @works = Work.all
  end

  def show
  	@work = Work.find(params[:id])
  end

  def new
  	@work = Work.new
  end

  def create
  		@work = Work.new(work_params)
  		@work.artist_id = current_user.artist.id
  	if @work.save
  		redirect_to work_path(@work)
  	else
  		render :new
  	end
  end

  def edit
    @work = Work.find(params[:id])
    if @work.artist.user != current_user
       redirect_to root_path
      end
  end

  def update
    @work = Work.find(params[:id])
    if @work.update(work_params)
      redirect_to work_path(@work.id)
    else
      render :edit
    end
  end

  def soft_delet
  end

  private

  def artist_user
  	redirect_to root_path unless current_user.is_artist?
  end

  private
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
