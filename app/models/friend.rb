class Friend
	include Mongoid::Document

	field :friend_uid
	field :initial_request_message
	field :reciprocal, type: Boolean
	field :requestor, type: Boolean
	belongs_to :user



	def get_profile #get profile info of the friend
		User.find(self.friend_uid)
	end

end