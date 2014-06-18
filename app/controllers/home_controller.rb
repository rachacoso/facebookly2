class HomeController < ApplicationController
  
	def front

		if session[:user_id]
		
			user = User.where(id: session[:user_id]).first

			@want_to_be_their_friend = []
			@wants_to_be_my_friend = []
			@myfriends = []
			@inqueue = [session[:user_id]] # array of ids to exclude from @allpeople list // exclude self


			# get people i requested
			myrequests = user.friends.i_asked.pluck(:friend_uid)
			@want_to_be_their_friend = User.in(_id: myrequests)
			@inqueue.concat myrequests
			
			# get people who requested me
			requestme = user.friends.who_asked_me.pluck(:friend_uid)
			@wants_to_be_my_friend= User.in(_id: requestme)
			@inqueue.concat requestme

			# get friends who accepted
			my_friends = user.friends.accepted.pluck(:friend_uid)
			@myfriends = User.in(_id: my_friends)
			@inqueue.concat my_friends

			# get all others
			@allpeople = User.not_in(:_id => @inqueue).order_by(:lastname.asc)

		end

	end

end
