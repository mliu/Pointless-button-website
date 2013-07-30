class ButtonsController < ApplicationController
  def index
  end

  def click
    current_user.click
    redirect_to buttons_path, notice: "You have clicked the button."
  end
end
