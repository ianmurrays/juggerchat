class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def current_user
    if session[:uid]
      @current_user ||= User.find session[:uid]
    else
      nil
    end
  end
  
  def signed_in?
    !!current_user 
  end
  
  helper_method :current_user, :signed_in? # This lets us use these methods in views
  
  def authorize!
    # TODO: create login page
    redirect_to login_path unless signed_in?
  end
end
