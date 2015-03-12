class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  skip_before_action :require_login, except: [:index]
  helper_method :current_user
  helper_method :current_relation
  helper_method :logged_in?

  def current_user
		if logged_in?
			return User.find(session[:logged_in_user])
		end
    flash[:warning] = "You're not logged in yet."
  end

  def current_relation
    if(session[:current_relation_id])
      @current_relation = Relation.where(id:session[:current_relation_id])[0]
    else
      @current_relation = nil
    end
  end

  def require_login
    unless logged_in?
      flash[:danger_message] = "You must be logged in to access this section"
      redirect_to root_path # halts request cycle
    end
  end

  def logged_in?
    return false if session[:logged_in_user].nil?
    true
  end
end
