module FormHelper
  def setup_user(user)
    user.publicprofile ||= Publicprofile.new
    user
  end
end