class Public::ClipExhibitionsController < Public::Base

	def create
		exhibition = Exhibition.find(params[:exhibition_id])
		if user_signed_in?
		clip = current_user.clip_exhibitions.new(exhibition_id: exhibition.id)
		clip.save
		redirect_to exhibition_path(exhibition)
		return
		end
		redirect_to exhibition_path(exhibition), notice: "会員登録しよう！"
	end

	def destroy
		exhibition = Exhibition.find(params[:exhibition_id])
		clip = current_user.clip_exhibitions.find_by(exhibition_id: params[:exhibition_id])
		clip.destroy
		redirect_to exhibition_path(exhibition)
	end

end
