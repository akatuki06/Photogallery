class Public::ClipsController < Public::Base
	before_action :authenticate_user!

  def index
  	@user = current_user
  	@works = @user.works
  	@artists = @user.artists
  	@exhibitions = @user.exhibitions
  end
end
