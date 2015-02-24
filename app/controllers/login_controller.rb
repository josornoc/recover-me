class LoginController < ApplicationController
	def create
		user = User.where(email:params[:email]).first		
		if user && user.authenticate(params[:password])
			session[:logged_in_user] = user.id
			redirect_to items_path(user)
		else
			flash[:error_logging_in] = "The User couldn't be logged in..."
		end
	end
	def destroy
		session[:logged_in_user] = nil
		redirect_to root_path
	end
end