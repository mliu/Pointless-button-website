class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :require_login
  protect_from_forgery with: :exception
  #force_ssl

  private
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def require_login
      if current_user == nil
        flash[:no_login] = "You must be logged in to access this page!"
        redirect_to root_url
    end

  end
  helper_method :current_user
end