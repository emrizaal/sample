class VideosController < ApplicationController
	def index
		@videos = Video.all
	end

	def new
		@video = Video.new
	end

	def show
		@video = Video.find(params[:id])
		@comment = Comment.new
		@comments = Comment.where(:video_id => params[:id])
	end

	def create
		@video = Video.new(video_params)

		if @video.save
			redirect_to videos_path, notice: "The video #{@video.name} has been uploaded."
		else
			render "new"
		end
	end

	def destroy
		@video = Video.find(params[:id])
		#@video = current_user.videos.find(params[:id])
		@video.destroy
		redirect_to videos_path, notice:  "The video #{@video.name} has been deleted."
	end

	private
	def video_params
		params.require(:video).permit(:name, :attachment)
	end
end
