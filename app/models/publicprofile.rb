class Publicprofile
	include Mongoid::Document

	field :interests, type: String

	embedded_in :User

end