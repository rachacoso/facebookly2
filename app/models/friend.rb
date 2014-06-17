class Friend
	include Mongoid::Document

	field :friend_uid
	field :initial_request_message
	field :accepted, type: Boolean
	belongs_to :user

	def get_profile #get profile info of the friend

	end

end