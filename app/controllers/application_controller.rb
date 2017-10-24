# General controller for the app
class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user_session, :current_user, :admin?

  private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end

  def require_user
    logger.debug 'ApplicationController::require_user'
    unless current_user
      store_location
      flash[:notice] = 'You must be logged in to access this page'
      redirect_to new_user_session_url
      return false
    end
  end

  def require_no_user
    logger.debug 'ApplicationController::require_no_user'
    if current_user
      store_location
      flash[:notice] = 'You must be logged out to access this page'
      return false
    end
  end

  def require_admin
    logger.debug 'ApplicationController::require_admin'
    unless admin?
      store_location
      flash[:notice] = 'You must be an administrator to access this page'
      redirect_to '/students'
      return false
    end
  end

  def store_location
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

  def admin?
    return current_user.admin
  end
  
  # Send a text message
  def txtmsg
  end
end
