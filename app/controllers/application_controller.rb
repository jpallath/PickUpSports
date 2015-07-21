class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :authenticate!
  helper_method :current_user

  private
  def current_user
    @current_user ||= User.find_by(uid: session[:user_id])
  end

  def authenticate!
    redirect_to "/auth/facebook" unless session[:user_id]
  end
end
