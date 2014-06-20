class Post
	include Mongoid::Document
	include Mongoid::Timestamps::Short
	
	field :content, type: String

	has_and_belongs_to_many :posters, class_name: "User", inverse_of: :postedbyme
	has_and_belongs_to_many :postees, class_name: "User", inverse_of: :postedtome

end