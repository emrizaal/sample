class CommentsController < ApplicationController
	def index
	end

	def new
		@comment = Comment.new
	end

	def create
		@comment = Comment.new(comment_params)

		if @comment.save
			redirect_to videos_path
		else
			render "new"
		end

	end

	def destroy
	end

	private
	def comment_params
		params.permit(:content, :video_id)
	end
end
