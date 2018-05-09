class Public::ClipExhibitionsController < Public::Base

	def create
		@exhibition = Exhibition.find(params[:exhibition_id])
		clip = current_user.clip_exhibitions.new(exhibition_id: @exhibition.id)
		clip.save
	end

	def destroy
		@exhibition = Exhibition.find(params[:exhibition_id])
		clip = current_user.clip_exhibitions.find_by(exhibition_id: params[:exhibition_id])
		clip.destroy
	end

end
