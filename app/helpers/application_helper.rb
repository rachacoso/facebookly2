module ApplicationHelper

	GENERIC_PROFILE_PHOTO = '/images/generic-profile-pic.png'

  def show_profile_photo (who, size)
  	# Tag to use in views
  	# <%= image_tag show_profile_photo(USER, :SIZE), size: "[25x25 or other customsize]" %> 

    if who.publicprofile.profile_photo_file_size
      img = who.publicprofile.profile_photo(size)
    else
      img = GENERIC_PROFILE_PHOTO
    end 

    return img

  end



end
