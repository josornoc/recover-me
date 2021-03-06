class RegistrationController < ApplicationController

  def create

    @user = User.new user_params
    if @user.save
      session[:logged_in_user] = @user.id
      flash["success_message"] = "You have registered succesfully!"
      redirect_to root_path
    else
      render "site/index"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end