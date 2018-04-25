class Public::ClipWorksController < Public::Base

	def create
		work = Work.find(params[:work_id])
		if user_signed_in?
		clip = current_user.clip_works.new(work_id: work.id)
		clip.save
		redirect_to work_path(work)
		return
		end
		redirect_to work_path(work), notice: "会員登録しよう！"
	end

	def destroy
		work = Work.find(params[:work_id])
		clip = current_user.clip_works.find_by(work_id: params[:work_id])
		clip.destroy
		redirect_to work_path(work)
	end

end
