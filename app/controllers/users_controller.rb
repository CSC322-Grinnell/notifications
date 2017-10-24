# Controller for Users such as teachers and administrators
class UsersController < ApplicationController
  before_filter :require_user, :not_admin

  def new
    @user = User.new
  end
  
  def not_admin
    if params[:id] && User.find(params[:id]) == current_user
      #checks if the current user is looking at themself
      return true
    else
      require_admin
    end
  end

  def create
    @user = User.new(params[:user])
    @user.login = :email
    @password_valid = false
    if @user.password != nil
      @password_length = @user.password.length > 7
      @password_uppercase = @user.password =~ /[A-Z]/ #checks if password contains uppercase letter
      @password_number = @user.password =~ /\d/ #checks if password contains a number
      @password_valid = true
    end
    # Saving without session maintenance to skip
    # auto-login which can't happen here because
    # the User has not yet been activated
    if(@password_valid && @password_length && @password_uppercase && @password_number)
      if @user.save
        flash[:notice] = 'Your account has been created.'
        redirect_to '/users'
      else
        flash[:notice] = 'There was a problem creating your account.'
        render action: :new
      end
    else
      flash[:notice] = "Password must contain at least one number, uppercase letter, and be at least 8 characters"
      render action: :new
    end
  end

  def index
    @user = current_user
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if (params[:user][:password]==(params[:user][:password_confirmation]))
      @name_exists = params[:user][:name].length > 0
      @password_length = params[:user][:password].length > 7
      @password_uppercase = (params[:user][:password] =~ /[A-Z]/) #checks if password contains uppercase letter
      @password_number = (params[:user][:password] =~ /\d/) #checks if password contains a number
      if (@name_exists)
        @user.update_attribute(:name , params[:user][:name])
      else
        flash[:notice] = "Name cannot be blank"
      end
      @user.update_attribute(:email , params[:user][:email])
      if(@password_length && @password_uppercase && @password_number)
        @user.update_attribute(:password , params[:user][:password])
      else
        flash[:notice] = "Password must contain at least one number, uppercase letter, and be at least 8 characters"
      end
      @user.update_attribute(:password_confirmation , params[:user][:password_confirmation])
      @user.update_attribute(:admin , params[:user][:admin])
      @user.update_attribute(:classroom_ids , params[:user][:classroom_ids])
      @user.update_attribute(:phone_number , params[:user][:phone_number])       
      if !flash[:notice]
        flash[:notice] = 'Account updated!'
        redirect_to @user
      else
        render :action => :edit
      end
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
    redirect_to '/users'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :classroom_ids => [])
    end

end
