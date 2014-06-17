class Post
	include Mongoid::Document


	field :on_wall_of, type: String
	field :content, type: String

	belongs_to :user
end