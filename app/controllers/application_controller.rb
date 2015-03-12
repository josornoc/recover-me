class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  skip_before_action :require_login, except: [:index]
  helper_method :current_user
  helper_method :current_relation

  def current_user
		if(session[:logged_in_user])
			@user = User.where(id: session[:logged_in_user])[0]
		else
      flash[:warning] = "You're not logged in yet."
		end
  end

  def current_relation
    if(session[:current_relation_id])
      @current_relation = Relation.where(id:session[:current_relation_id])[0]
    else
      @current_relation = nil
    end
  end

  private

  def logged_in?
    return false if session[:logged_in_user].nil?
    true
  end

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to root_path # halts request cycle
    end
  end
end
