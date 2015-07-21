class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

 
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
  
  #  unfinished method, available to all controllers. supposed to verify that session is valid
  #  and that the user is still logged into facebook. NOt sure how to do this part yet but oh well. We can add it later. 
  def authenticate!
    if session[:user_id]==nil
      redirect_to "/auth/facebook"
    end
  end
  helper_method :authenticate!
end
