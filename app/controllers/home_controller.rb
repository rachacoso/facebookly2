class HomeController < ApplicationController
  
	def front

		if session[:user_id]

			

		
			user = User.where(id: session[:user_id]).first
			@want_to_be_their_friend = []
			@wants_to_be_my_friend = []
			@inqueue = []

			myrequests = user.friends.where(reciprocal: false, requestor: true)
			myrequests.each do |request|
				@want_to_be_their_friend << User.find(request.friend_uid)
				@inqueue << request.friend_uid
			end

			requestme = user.friends.where(reciprocal: false, requestor: false)
			requestme.each do |request|
				@wants_to_be_my_friend << User.find(request.friend_uid)
				@inqueue << request.friend_uid
			end

			# @allpeople = User.all.order_by(:lastname.asc)
			@allpeople = User.not_in(:_id => @inqueue)


		end

	end

end
