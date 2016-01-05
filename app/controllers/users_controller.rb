class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.create(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "User created"
      redirect_to root_path
    else
      flash[:danger] = "Credentials invalid"
      redirect_to "/signup"
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
