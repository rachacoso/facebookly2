class HomeController < ApplicationController
  
	def front
		@allpeople = User.all
		
		
	end

end
