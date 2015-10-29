# Controller for Users such as teachers and administrators
class UsersController < ApplicationController
  before_filter :require_user, :require_admin

  def new
    @user = User.new
    @userclassroom = Classroom.all
  end

  def create
    @user = User.new(params[:user])
    @user.login = :email

    # Saving without session maintenance to skip
    # auto-login which can't happen here because
    # the User has not yet been activated
    if @user.save
      flash[:notice] = 'Your account has been created.'
      redirect_to '/user'
    else
      flash[:notice] = 'There was a problem creating your account.'
      render action: :new
    end
  end

  def show
    @user = current_user
    @users = User.all
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
      @user = User.find(params[:id])
      if (params[:user][:password]==(params[:user][:password_confirmation]))

        @user.update_attribute(:name , params[:user][:name])
        @user.update_attribute(:email , params[:user][:email])
        @user.update_attribute(:password , params[:user][:password])
        @user.update_attribute(:password_confirmation , params[:user][:password_confirmation])
        @user.update_attribute(:admin , params[:user][:admin])
        flash[:notice] = 'Account updated!'
        redirect_to '/user'
      else
        flash[:notice] = "Passwords aren't the same"
        render :action => :edit
      end
    end

  def destroy
    num_admin = User.find_all_by_admin(true)
    if User.find(params[:id]).admin == false
      User.find(params[:id]).destroy
    elsif num_admin.size > 1
      User.find(params[:id]).destroy
      flash[:notice] = 'User deleted.'
    else
      flash[:notice] = 'Unable to delete the last admistrator.'
    end
    redirect_to '/user'
  end
  
end
