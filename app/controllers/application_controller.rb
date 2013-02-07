class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :logged_in, :check_logged_in

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end


  def logged_in
    if session[:user_id]
      return true
    else
      return false
    end
  end

  def check_logged_in
    unless logged_in
      redirect_to login_path, :notice => "In order see the page you need to be logged in."
    end
  end
end
