class UserController < ApplicationController
  
	def new
	end

	def create
		user = User.new
		user.firstname = params[:user][:firstname]
		user.lastname = params[:user][:lastname]
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

		user.firstname = params[:user][:firstname]
		user.lastname = params[:user][:lastname]
		user.email = params[:user][:email]
		user.save!

		redirect_to '/preferences/edituser', :flash => { :userupdate => "Your have successfully updated your profile!" }

	end

end