class User
	include Mongoid::Document
	include ActiveModel::SecurePassword 	# this, along with the 
																				# 'has_secure_password' below
																				# enables all the pwd hashing
	field :firstname, type: String
	field :lastname, type: String
	field :email, type: String
	field :password_digest, type: String

	validate :email, presence: true, uniqueness: true



	embeds_many :friends do 
		def i_asked
			where(reciprocal: false, requestor: true)
		end
		def who_asked_me
			where(reciprocal: false, requestor: false)
		end
		def accepted
			where(reciprocal: true)
		end
		def get_message(id)
			where(friend_uid: id).first.initial_request_message
		end
	end

	has_many :posts



	has_secure_password


end