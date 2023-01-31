class UsersController < ApplicationController

  @error_message = "Error Message:"
  def new
  end
  
  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'

      # if user signup failed
    else
      redirect_to '/signup', notice: "Signup Failed."
    end
  end 

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end