class PostsController < ApplicationController

	before_action :authenticate_user!

	def index
		@posts = Post.all
	end

	def new
		@user = User.find(params[:user_id])
		@post = Post.new
	end

	def create
		Post.new(params[:post].permit(:title, :description, :image))
		redirect_to user_posts_path
	end
end
