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

	embeds_many :friends

	has_many :posts

	has_secure_password


end