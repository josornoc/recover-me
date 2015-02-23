class RegistrationController < ApplicationController
	def new
    @user = User.new
  end
  def create
    @user = User.new user_params
    if @user.save
      # send email instantly
      # got to send email here!!!!
      # CatMailer.welcome_email(@cat).deliver
      # redirection to index.html
      # logged when registered, only to try...
      session[:logged_in_user] = @user.id
      redirect_to root_path
    else
      render :new
      # raise "Ocurrió un problema creando un gato nuevo..."
    end
  rescue ActiveRecord::RecordNotUnique
    @user.errors.add(:email, "This email is already in the database")
    render :new     
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end