# Controller for authlogic user sessions
class UserSessionsController  < ApplicationController
  layout 'login'

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      puts @current_user
      redirect_back_or_default '/text'
    else
      render action: :new
    end
  end

  def destroy
    current_user_session.destroy
    redirect_back_or_default new_user_session_url
  end
end
