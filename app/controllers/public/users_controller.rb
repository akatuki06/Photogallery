class Public::UsersController < Public::Base
	before_action :authenticate_user!

  def show
  	@user = User.find(current_user)
  end

  def unsubscribe
  end

  def soft_delete
  	user = current_user
  	user.update(is_deleted: true)
  	redirect_to static_pages_end_path
  end
end
