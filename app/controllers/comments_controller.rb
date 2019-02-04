class CommentsController < ApplicationController
	def create
		Comment.create(text: params[:comment][:text],blog_id: params[:blog_id],user_id: current_user.id)
	end

	# private
	# def comment_params
	# 	params.permit(:comment,:blog_id)
	# end
end
