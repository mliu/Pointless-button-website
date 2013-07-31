class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:user_create] = "Successfully created user"
      redirect_to root_path
    else
      render "new"
    end
  end

  def click
    @user = current_user
    if @user.valid_click?
      @user.update_attribute(:clicks, @user.read_attribute(:clicks).to_i + 1)
      @user.update_attribute(:end_time, Time.now + rand(5..6000))
      redirect_to buttons_path, notice: "You have clicked the button!"
    else
      flash[:early_click] = "You clicked too early! (+20 minutes)"
      @user.update_attribute(:end_time, @user.read_attribute(:end_time).to_s.to_time() + 1200)
      redirect_to buttons_path
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end