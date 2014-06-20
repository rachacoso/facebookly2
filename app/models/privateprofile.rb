class Privateprofile
	include Mongoid::Document


	field :someprivatestuff, type: String

	embedded_in :User

end