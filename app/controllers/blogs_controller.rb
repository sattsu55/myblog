class BlogsController < ApplicationController
	def index
		@blog = Blog.all
	end

    def create
        Blog.create(blog_params)
    end

    private
    def blog_params
        params.permit(:title, :image, :content)
    end
end
