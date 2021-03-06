class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :get_current_user



  private

  def get_current_user
  	if session[:user_id]
      if User.find(session[:user_id])
    		@current_user = User.find(session[:user_id])
      else
       session.destroy
       @current_user = nil
      end
  	end
  end
  
end
