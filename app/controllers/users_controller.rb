class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  require 'will_paginate/array'
  def new
    @disable_header = true
    @user = User.new
  end

  def button
  end

  def show
    @user_items = User.all.sort{|y,x| x.points.count <=> y.points.count}
    @user = User.find(params[:id])
  end

  def index
    @user_items = User.all.sort{|y,x| x.points.count <=> y.points.count}.paginate(page: params[:page], per_page: 15)
  end

  def create
    @disable_header = true
    @user = User.new(user_params)
    if @user.save
      flash[:user_create] = "Successfully created user"
      redirect_to root_path
    else
      render 'new'
    end
  end

  # def click
  #   @user = current_user
  #   if @user.valid_click?
  #     @c = Click.new(user_id: cur)
  #     @user.update_attribute(:end_time, Time.now + [86400, 172800, 259200, 345600, 432000, 518400, 604800].sample)
  #     flash[:click] = "You have clicked the button!"
  #     #redirect_to button_path, notice: "You have clicked the button!"
  #   else
  #     flash[:early_click] = "You clicked too early! (+1 day)"
  #     @user.update_attribute(:end_time, @user.read_attribute(:end_time).to_s.to_time() + 86400)
  #     #redirect_to button_path
  #   end
  #   respond_to do |format|
  #     format.html { redirect_to button_path }
  #     format.js { redirect_to timer.js }
  #   end
  # end

  private

    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end