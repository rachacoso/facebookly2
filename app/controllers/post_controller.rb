class PostController < ApplicationController

	def create

		posted_to = User.find(params[:post][:postee_id])
		posted_by = @current_user


	  post = Post.new
		post.content = params[:post][:content]

		posted_to.postedtome.push(post)
		posted_by.postedbyme.push(post)

		redirect_to :back

	end

end