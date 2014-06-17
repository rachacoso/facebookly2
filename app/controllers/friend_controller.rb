class FriendController < ApplicationController

	def new
		@friend_to_be = User.where(id: params[:id]).first
	end

	def create


	end


end