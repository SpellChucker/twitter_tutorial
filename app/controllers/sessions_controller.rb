class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user
      log_in user
      redirect_to root_path
    else
      flash[:danger] = "Invalid username"
      render 'new'
    end
  end

  def destroy
  end
end
