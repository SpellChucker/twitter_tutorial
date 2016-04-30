class UsersController < ApplicationController
  def index
    @user = User.new
    @users = User.all
  end

  def create
    if params[:user][:username].size == 0
      flash[:alert] = "Username is required!"
    else
      user = User.new(username: params[:user][:username])
      if user.save
        redirect_to users_path
      else
        flash[:alert] = "Couldn't Save!"
      end
    end
  end

  def show
    @user = get_user
  end

  private
  def get_user
    User.find(params[:id])
  end
end
