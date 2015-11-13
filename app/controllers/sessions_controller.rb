class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by(username: params[:user][:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
    else
      flash[:alert] = "username or password is invalid"
    end
    redirect_to questions_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to questions_path
  end

end
