class LoginController < ApplicationController

	def create
		user = User.where(email:params[:email]).first
		if user && user.authenticate(params[:password])
			session[:logged_in_user] = user.id
			#flash["success_message"] = "Welcome " + user.name.to_s + "!"
			redirect_to root_path
		else
			flash.now["warning_message"] = "The User couldn't be logged in"
			@user = User.new
			render "site/index"
		end
	end

	def destroy
		session[:logged_in_user] = nil
		redirect_to root_path
	end

end