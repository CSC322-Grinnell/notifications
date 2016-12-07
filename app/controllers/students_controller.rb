
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
    @contacts = Contact.all
    @contact = Contact.new
  end

  def create
    @student = Student.new(params[:student])
    #@student.Phone_Number.gsub!(/\D/, '') #make the student phone number only digits, so they can be counted easy
    if @student.save
      flash[:notice] = 'Student was successfully created.'
      # If new student has no contacts, create a new contact
      if @student.contact_ids == []
        redirect_to new_contact_path
      # Else, redirect to the student
      else
        redirect_to @student
      end
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

    @name_exists = params[:students][:name].length > 0
    #@phone_valid = params[:students][:phone].to_s.length == 10
    if @name_exists
      @student.update_attribute(:student_name , params[:students][:name])
    else
      flash[:notice] = 'Name cannot be blank'
    end
    #@student.update_attribute(:Parent_Name , params[:students][:parent_name])
    #@student.update_attribute(:Email , params[:students][:email])
    @student.update_attribute(:classroom_ids, params[:students][:classroom_ids])
    @student.update_attribute(:contact_ids, params[:students][:contact_ids])
    
   
    if !flash[:notice]
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
