class CommentsController < ApplicationController
	def create
		@comment = Comment.create(comment_params)
	    respond_to do |format|
	      format.html {redirect_to blog_path(params[:blog_id]) }
	      format.json
	    end
	end

	private
	def comment_params
		params.require(:comment).permit(:text).merge(blog_id: params[:blog_id],user_id: current_user.id)
	end
end
