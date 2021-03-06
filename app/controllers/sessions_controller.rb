class SessionsController < ApplicationController
  def create
    # Create or get the user object from the DB
    user = User.create_or_get_from_omniauth request.env['omniauth.auth']
    
    # Create the session, really simple, but what the hell ...
    session[:uid] = user.id
    
    # TODO: Redirect to chat room selection
    redirect_to rooms_path
  end
  
  def destroy
    session[:uid] = nil
    redirect_to login_path
  end
  
  def new
  end
end
