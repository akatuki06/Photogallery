class Admin::WorksController < Admin::Base
	before_action :authenticate_admin!
	before_action :set_work, except: [:index]

  def index
    @search = Work.ransack(params[:q])
  	@works = @search.result.page(params[:page]).reverse_order
  end

  def show
  end

  def edit
  end

  def update
  		@work.update(is_deleted: !@work.is_deleted?, stock: 0)
  		redirect_to admin_work_path(@work), notice: "更新しました"
  end

  private

  def set_work
  	@work = Work.find(params[:id])
  end

  def work_params
  	params.require(:work).permit(:is_destroy)
  end
end
