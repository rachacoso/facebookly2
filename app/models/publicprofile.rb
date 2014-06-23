class Publicprofile
	include Mongoid::Document
	include Mongoid::Paperclip

  has_mongoid_attached_file :profile_photo,
	  :styles => {
	    :original => ['1920x1680>', :jpg],
	    :small    => ['100x100#',   :jpg],
	    :medium   => ['250x250',    :jpg],
	    :large    => ['500x500>',   :jpg]
	  }
	validates_attachment_content_type :profile_photo, :content_type=>['image/jpeg', 'image/png', 'image/gif']
	
	field :firstname, type: String
	field :lastname, type: String

	embedded_in :User

end