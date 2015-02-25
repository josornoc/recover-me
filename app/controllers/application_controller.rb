class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def current_user
		if(session[:logged_in_user])
			User.where(id: session[:logged_in_user])[0]
		else 
			nil
		end
  end
end
