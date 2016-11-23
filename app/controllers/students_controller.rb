
# Controller for the students in a class
class StudentsController < ApplicationController
  before_filter :require_user
  #before_filter :not_admin, except: [:create, :index, :show]

  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
    @classrooms = Classroom.all
  end

  def create
    @student = Student.new(params[:student])
    #@student.Phone_Number.gsub!(/\D/, '') #make the student phone number only digits, so they can be counted easy
    if @student.save
      flash[:notice] = 'Student was successfully created.'
      redirect_to @student
    else
      flash[:notice] = 'There was a problem creating the student.'
      render action: :new
    end
  end

def edit
  @student = Student.find(params[:id])
end

  def update
    @id = params[:id]
    @student = Student.find(params[:id])

    if @student.update_attributes(params[:student])
      
      #params[:students][:phone].to_s.gsub!(/\D/, '')
      #@phone_valid = params[:students][:phone].to_s.length == 10
      @student.update_attribute(:Student_Name , params[:students][:name])
      #@student.update_attribute(:Parent_Name , params[:students][:parent_name])
      #@student.update_attribute(:Email , params[:students][:email])
      @student.update_attribute(:classroom_ids, params[:students][:classroom_ids])
      @student.update_attribute(:contact_ids, params[:students][:contact_ids])
      
      #if @phone_valid
      #  @student.update_attribute(:Phone_Number , params[:students][:phone])
      #else
      #  flash[:notice] = "Phone number is invalid."
      #end
      flash[:notice] = 'Student updated successfully'
      redirect_to @student
    else
      render action: :edit
    end
  end

  def destroy
    Student.find(params[:id]).destroy
    flash[:notice] = 'Student deleted.'
    redirect_to '/students'
  end
end