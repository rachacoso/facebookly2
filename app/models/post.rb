class Post
	include Mongoid::Document
	include Mongoid::Timestamps::Short
	include Mongoid::Paperclip

  has_mongoid_attached_file :post_photo,
	  :styles => {
	    :medium   => ['250x250',    :jpg],
	    :large    => ['500x500>',   :jpg]
	  }
	validates_attachment_content_type :post_photo, :content_type=>['image/jpeg', 'image/png', 'image/gif']
	

	field :content, type: String

	belongs_to :posted_by, class_name: "User", inverse_of: :posted_by_user
	belongs_to :posted_to, class_name: "User", inverse_of: :posted_to_user

end