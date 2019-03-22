class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      UserMailer.welcome_email(user).deliver
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/register'
    end
  end

  # Private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
