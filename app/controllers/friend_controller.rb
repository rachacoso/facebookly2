class FriendController < ApplicationController

	def new
		@friend_to_be = User.where(id: params[:id]).first
	end

	def create

		requestor = User.where(id: session[:user_id]).first
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

		@friend_to_be = requestee

	end

	def destroy
		requestor = User.where(id: session[:user_id]).first
		a = requestor.friends.where(friend_uid: params[:id]).first
		requestor.friends.delete(a)

		requestee = User.where(id: params[:id]).first
		b = requestee.friends.where(friend_uid: session[:user_id]).first
		requestee.friends.delete(b)

		redirect_to '/'

	end

end