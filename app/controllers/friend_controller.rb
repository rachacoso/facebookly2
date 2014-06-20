class FriendController < ApplicationController

	def new
		@friend_to_be = User.where(id: params[:id]).first
	end

	def create

		requestor = @current_user
		friend_requestor = requestor.friends.find_or_initialize_by(friend_uid: params[:friendid])
		friend_requestor.initial_request_message = params[:friend][:initial_request_message]
		friend_requestor.reciprocal = false
		friend_requestor.requestor = true
		friend_requestor.save!

		requestee = User.where(id: params[:friendid]).first
		friend_requestee = requestee.friends.find_or_initialize_by(friend_uid: session[:user_id])
		friend_requestee.initial_request_message = params[:friend][:initial_request_message]
		friend_requestee.reciprocal = false
		friend_requestee.requestor = false
		friend_requestee.save!

		# flash[:requestsent] = "Your request has been sent to #{requestee.firstname}"

		redirect_to '/', :flash => { :requestsent => "Your request has been sent to #{requestee.firstname}" }

	end

	def destroy
		requestor = @current_user
		a = requestor.friends.where(friend_uid: params[:id]).first
		requestor.friends.delete(a)

		requestee = User.where(id: params[:id]).first
		b = requestee.friends.where(friend_uid: session[:user_id]).first
		requestee.friends.delete(b)

		redirect_to '/'

	end

	def accept

		requestor = User.where(id: params[:id]).first
		b = requestor.friends.where(friend_uid: session[:user_id]).first
		b.reciprocal = true
		requestor.save!

		requestee = @current_user
		a = requestee.friends.where(friend_uid: params[:id]).first
		a.reciprocal = true
		requestee.save!

		redirect_to '/'

	end

	def view
		@friend = User.where(id: params[:id]).first
		@wall_posts = @friend.postedtome

	end


end