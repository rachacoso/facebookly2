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
<<<<<<< HEAD
=======
			@myrequests = user.friends.i_asked.only(:friend_uid, :initial_request_message)
>>>>>>> cd82414d2fe61bf23aa3da6578a1b358c4b4d070
			@want_to_be_their_friend = User.in(_id: myrequests_ids)
			@inqueue.concat myrequests_ids
			
			# get people who requested me
			requestme_ids = user.friends.who_asked_me.pluck(:friend_uid)
<<<<<<< HEAD
			requestme_ids.each do |f| # put messages into hash for UI
				@friendrequestmessages[f] = @current_user.friends.get_message(f)
			end
=======
>>>>>>> cd82414d2fe61bf23aa3da6578a1b358c4b4d070
			@wants_to_be_my_friend= User.in(_id: requestme_ids)
			@inqueue.concat requestme_ids

			# get friends who accepted
			my_friends_ids = user.friends.accepted.pluck(:friend_uid)
			@myfriends = User.in(_id: my_friends_ids)
			@inqueue.concat my_friends_ids

			# get all others
			@allpeople = User.not_in(:_id => @inqueue).order_by(:lastname.asc)

		end

	end

end
