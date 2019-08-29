class PostsController < ApplicationController
	before_action :logged_in_user,   only:[:new, :create]

	def new
		@post = current_user.posts.new
	end

	def create
		@post = current_user.posts.build(post_params)
		# @user = User.find_by(email: current_user.email.downcase)
		if @post.save
			flash[:success] = "Post successfully created."
			# @post.update_attribute(:user_id, @user.id)
			redirect_to root_path
		 else
			puts @post.errors.messages
			puts @user.email
		 	flash.now[:danger] = "Invalid post"
		 	render "new"
		 end
	end

	def index
		@posts = Post.paginate(page: params[:page])
	end

	private
	
		def post_params
			params.require(:post).permit(:title, :body)
		end
end
