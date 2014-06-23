class UserController < ApplicationController
  
	def new
	end

	def create
		user = User.new
		user.publicprofile = Publicprofile.new(
			firstname: params[:user][:publicprofile_attributes][:firstname],
			lastname: params[:user][:publicprofile_attributes][:lastname],
			profile_photo: params[:user][:publicprofile_attributes][:profile_photo]
		)
		user.email = params[:user][:email]
		user.password = params[:user][:password]
		user.password_confirmation = params[:user][:password_confirmation]
		user.save!
		session[:user_id] = user.id.to_s
		redirect_to '/'

	end

	def update
	end

	def do_update

		user = @current_user
		user.publicprofile.firstname = params[:user][:publicprofile_attributes][:firstname]
		user.publicprofile.lastname = params[:user][:publicprofile_attributes][:lastname]
		user.publicprofile.profile_photo = params[:user][:publicprofile_attributes][:profile_photo]
		user.email = params[:user][:email]
		user.save!

		redirect_to '/preferences/edituser', :flash => { :userupdate => "Your have successfully updated your profile!" }

	end

  private

  def user_params
    params.require(:user).permit(publicprofile_attributes: [:profile_photo])
  end

end