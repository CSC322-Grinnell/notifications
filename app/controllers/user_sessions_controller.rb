# Controller for authlogic user sessions
class UserSessionsController  < ApplicationController
  layout 'login'

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = 'Login successful!'
      puts @current_user
      redirect_back_or_default '/students' # account_url(@current_user)
    else
      render action: :new
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = 'Logout successful!'
    redirect_back_or_default new_user_session_url
  end
end
