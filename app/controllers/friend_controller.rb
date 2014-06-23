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
		# friend_requestor.save!

		requestee = User.where(id: params[:friendid]).first
		friend_requestee = requestee.friends.find_or_initialize_by(friend_uid: session[:user_id])
		friend_requestee.initial_request_message = params[:friend][:initial_request_message]
		friend_requestee.reciprocal = false
		friend_requestee.requestor = false
		# friend_requestee.save!

		# flash[:requestsent] = "Your request has been sent to #{requestee.firstname}"

		
		# only send email if save successful

		if friend_requestor.save! && friend_requestee.save!
			redirect_to '/', :flash => { :requestsent => "Your request has been sent to #{requestee.publicprofile.firstname}" }
		else
			redirect_to :back
		end

		# send email



	end

	def destroy
		requestor = @current_user
		a = requestor.friends.where(friend_uid: params[:id]).first
		a.delete

		requestee = User.where(id: params[:id]).first
		b = requestee.friends.where(friend_uid: session[:user_id]).first
		b.delete

		redirect_to '/'

	end

	def accept

		requestor = User.where(id: params[:id]).first
		b = requestor.friends.where(friend_uid: session[:user_id]).first
		b.reciprocal = true
		b.save!

		requestee = @current_user
		a = requestee.friends.where(friend_uid: params[:id]).first
		a.reciprocal = true
		a.save!

		redirect_to '/'

	end

	def view
		@friend = User.where(id: params[:id]).first
		fof_ids = @friend.friends.accepted.pluck(:friend_uid)
		@friends_of_friend = User.in(_id: fof_ids).order_by(:lastname.asc)
		@wall_posts = @friend.posted_to_user
	end


end