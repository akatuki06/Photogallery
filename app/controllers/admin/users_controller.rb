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
    if @user.is_artist?
      @user.artist.update!(is_deleted: true)
      if @user.artist.works.present?
      @user.artist.works.all.update(is_deleted: true)
        if @user.artist.exhibition.present?
        @user.artist.exhibition.destroy
        end
      end
    end
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
