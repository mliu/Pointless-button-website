class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:create]
  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to button_path, notice: "Logged in!"
    else
      flash[:invalid_login] = "Invalid username or password"
      redirect_to root_url
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:logout] = "Logged out!"
    redirect_to root_url
  end
end
