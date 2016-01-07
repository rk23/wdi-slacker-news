class UsersController < ApplicationController

  def show
    @user = User.find params[:id]
    @posts = @user.posts.sort_by{|x| x.created_at}.reverse
    @comments = @user.comments.sort_by{|x| x.created_at}.reverse
      # @user.comments isn't returning anything
  end

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
    params.require(:user).permit(:email, :password, :name)
  end

end
