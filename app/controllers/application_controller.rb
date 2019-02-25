class ApplicationController < ActionController::Base
  def current_user
    @current_user ||= User.find(session[:user_id])
  end
  helper_method :current_user

  def current_user_exists
    true unless session[:user_id].nil?
  end
  helper_method :current_user_exists
end
