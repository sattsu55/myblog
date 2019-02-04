class CommentsController < ApplicationController
	def create
		Comment.create(comment_params)
	end

	private
	def comment_params
		params.require(:comment).permit(:text).merge(blog_id: params[:blog_id],user_id: current_user.id)
	end
end
