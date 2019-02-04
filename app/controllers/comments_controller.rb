class CommentsController < ApplicationController
	def create
		Comment.create(text: comment_params[:text],blog_id: comment_params[:blog_id],user_id: current_user.id)
	end

	private
	def comment_params
		params.permit(:text,:blog_id)
	end
end
