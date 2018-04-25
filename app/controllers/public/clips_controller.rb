class Public::ClipsController < Public::Base
  def index
  	@user = current_user
  	@works = @user.works
  	@artists = @user.artists
  	@exhibitions = @user.exhibitions
  end
end
