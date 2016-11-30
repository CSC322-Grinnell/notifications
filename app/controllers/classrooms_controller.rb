# Controls the classrooms that are within the Head Start schools.
class ClassroomsController < ApplicationController
  before_filter :require_user
  #before_filter :require_admin, except: [:index, :show]
  before_filter :set_classroom, only: [:show, :edit, :update, :destroy]

  def index
    @classroom = Classroom.all
  end

  def show
    @classroom = Classroom.find(params[:id])
    @students = Student.all
  end

  def new
    @classroom = Classroom.new
    @users = User.all
  end

  def edit
    @classroom = Classroom.find(params[:id])
  end
  
  def update
    @id = params[:id]
    @classroom = Classroom.find(params[:id])

    if @classroom.update_attributes(params[:classroom])
      
      @classroom.update_attribute(:name , params[:classrooms][:name])
      @classroom.update_attribute(:student_ids, params[:classrooms][:student_ids])
      
      if admin?
        @classroom.update_attribute(:user_ids, params[:classrooms][:user_ids])
      end
      
      #if @phone_valid
      #  @student.update_attribute(:Phone_Number , params[:students][:phone])
      #else
      #  flash[:notice] = "Phone number is invalid."
      #end
      flash[:notice] = 'Classroom updated successfully'
      redirect_to @classroom
    else
      render action: :edit
    end
  end

  def create
    @classroom = Classroom.new(params[:classroom])
    if @classroom.save
      flash[:notice] = 'Classroom was successfully created.'
      redirect_to @classroom
    else
      flash[:notice] = 'There was a problem creating the classroom.'
      render action: :new
    end
  end

  def destroy
    Classroom.find(params[:id]).destroy
    flash[:notice] = 'Classroom deleted.'
    redirect_to '/classrooms'
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classroom
      @classroom = Classroom.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:classroom).permit(:name, :user_ids => [])
    end
    
end
