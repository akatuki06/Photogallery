class Admin::UsersController < Admin::Base
	before_action :authenticate_user!

end
