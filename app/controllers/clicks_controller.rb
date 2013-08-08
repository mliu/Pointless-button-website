class ClicksController < ApplicationController
  def click
    @user = current_user
    @user.check
    if @user.valid_click?
      @c = Click.new
      @c.update_attribute(:user_id, current_user.id)
      @user.update_attribute(:end_time, Time.now + [86400, 172800, 259200, 345600, 432000, 518400, 604800].sample)
      flash[:click] = "You have clicked the button!"
      #redirect_to button_path, notice: "You have clicked the button!"
    else
      flash[:early_click] = "You clicked too early! (+1 day)"
      @user.update_attribute(:end_time, @user.read_attribute(:end_time).to_s.to_time() + 86400)
      #redirect_to button_path
    end
    respond_to do |format|
      format.html { redirect_to button_path }
      format.js { redirect_to timer.js }
    end
  end
end
