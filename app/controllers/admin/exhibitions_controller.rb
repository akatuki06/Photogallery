class Admin::ExhibitionsController < Admin::Base
	before_action :authenticate_admin!

  def index
  	@search = Exhibition.ransack(params[:q])
  	@exhibitions = @search.result.page(params[:page]).reverse_order
  end

  def destroy
  	e = Exhibition.find(params[:id])
  	e.destroy
  	redirect_to admin_exhibitions_path
  end
end
