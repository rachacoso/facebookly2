class PostController < ApplicationController

	def create

		post_to = User.find(params[:post][:postee_id])
		post_by = @current_user


	  post = Post.new
		post.content = params[:post][:content]
		post.post_photo = params[:post][:post_photo]

		post_to.posted_to_user.push(post)
		post_by.posted_by_user.push(post)

		redirect_to :back

	end

end