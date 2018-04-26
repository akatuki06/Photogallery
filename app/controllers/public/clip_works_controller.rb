class Public::ClipWorksController < Public::Base

	def create
		@work = Work.find(params[:work_id])
		clip = current_user.clip_works.new(work_id: @work.id)
		clip.save
	end

	def destroy
		@work = Work.find(params[:work_id])
		clip = current_user.clip_works.find_by(work_id: params[:work_id])
		clip.destroy
	end

end
