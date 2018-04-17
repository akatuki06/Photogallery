class Public::UsersController < Public::Base
	before_action :authenticate_user!

  def unsubscribe
  end

  def soft_delete
  	user = current_user
  	user.update(is_deleted: true)
  	redirect_to root_path
  end
end
