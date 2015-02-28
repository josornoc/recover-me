class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :current_relation

  def current_user
		if(session[:logged_in_user])
			@user = User.where(id: session[:logged_in_user])[0]
		else
			@user = nil
		end
  end

  def current_relation
    if(session[:current_relation_id])
      @current_relation = Relation.where(id:session[:current_relation_id])[0]
    else
      @current_relation = nil
    end
  end
end
