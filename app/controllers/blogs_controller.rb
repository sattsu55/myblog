class BlogsController < ApplicationController
	before_action :move_to_index, except: :index

	def index
		@blog = Blog.includes(:user).all.order("id DESC").page(params[:page]).per(5)
	end

    def create
        Blog.create(blog_params)
    end

    def destroy
        blog = Blog.find(params[:id])
        blog.destroy if blog.user_id === current_user.id
    end

    def edit
        @blog = Blog.find(params[:id])
        redirect_to action: :index unless @blog.user_id == current_user.id
    end

    def new
        @blog = Blog.new
    end

    def update
        blog = Blog.find(params[:id])
        blog.update(blog_params) if blog.user_id == current_user.id
    end

    private
    def blog_params
        params.require(:blog).permit(:title, :image, :content).merge(user_id: current_user.id)
    end

    def move_to_index
      redirect_to action: :index unless user_signed_in?
    end

end
