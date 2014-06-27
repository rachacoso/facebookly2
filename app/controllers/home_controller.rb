class HomeController < ApplicationController
  
	def front

		if @current_user

			user = @current_user
			@want_to_be_their_friend = []
			@wants_to_be_my_friend = []
			@myfriends = []
			@friendrequestmessages = Hash.new
			@inqueue = [session[:user_id]] # array of ids to exclude from @allpeople list // exclude self


			# get people i requested
			myrequests_ids = user.friends.i_asked.pluck(:friend_uid)
			@want_to_be_their_friend = user.get_friends(myrequests_ids)
			@inqueue.concat myrequests_ids
			
			# get people who requested me
			requestme_ids = user.friends.who_asked_me.pluck(:friend_uid)
			@wants_to_be_my_friend = user.get_friends(requestme_ids)
			@inqueue.concat requestme_ids

			# get friends who accepted
			my_friends_ids = user.friends.accepted.pluck(:friend_uid)
			@myfriends = user.get_friends(my_friends_ids)
			@inqueue.concat my_friends_ids

			# get all others
			@allpeople = User.not_in(:_id => @inqueue).order_by(:'publicprofile.lastname'.asc)

			# get wall posts
			@wall_posts = @current_user.posted_to_user
			@wall_posts_feed = Post.all.desc('_id').limit(10)


		else

			# hacky way to get users to display on front page (not logged in)
			# ensuring that those with pictures are displayed if they exist (else show with default pic)
			@all_people = User.all.limit(3).order_by(:'publicprofile.profile_photo_file_size'.desc)

		end

	end

end
