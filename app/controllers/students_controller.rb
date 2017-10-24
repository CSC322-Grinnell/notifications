# Controller for the students in a class
class StudentsController < ApplicationController
  before_filter :require_user

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
      print("we are here")
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @id = params[:id]
    @student = Student.find(params[:id])

    @name_exists = params[:students][:name].length > 0
    if @name_exists
      @student.update_attribute(:student_name , params[:students][:name])
    else
      flash[:notice] = 'Name cannot be blank'
    end
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
