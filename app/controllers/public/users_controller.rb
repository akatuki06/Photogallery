class Public::UsersController < Public::Base
	before_action :authenticate_user!, except: [:soft_delete]

  def show
  	@user = User.find(current_user)
  end

  def unsubscribe
  end

  def soft_delete
  	user = current_user
  	user.update(is_deleted: true)
    if user.is_artist?
      user.artist.update!(is_deleted: true)
      if user.artist.works.present?
      user.artist.works.all.update(is_deleted: true)
        if user.artist.exhibition.present?
        user.artist.exhibition.destroy
        end
      end
    end
    session.destroy
  	redirect_to static_pages_end_path
  end

end
