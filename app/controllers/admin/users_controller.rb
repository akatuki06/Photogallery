class Admin::UsersController < Admin::Base
	before_action :authenticate_admin!
	before_action :set_user, except: [:index]

  def index
  	@search = User.ransack(params[:q])
    @users = @search.result.page(params[:page]).reverse_order
  end

  def show
  end

  def edit
  end

  def update
  		@user.update(is_deleted: !@user.is_deleted?)
  		redirect_to admin_user_path(@user), notice: "更新しました"
  end

  private

  def set_user
  	@user = User.find(params[:id])
  end

  def user_params
  	params.require(:user).permit(:is_destroy)
  end

end
