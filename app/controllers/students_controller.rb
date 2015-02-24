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
end

def edit
  @student = Student.find(params[:id])
end

def create
  @student = Student.new(params[:student])
  if @student.save
  	flash[:notice] = "Student was successfully created."
    redirect_to @student
  else
   	flash[:notice] = "There was a problem creating the student."
   	render :action => :new
  end
end

def update
  @student = Student.find(params[:id])

  if @student.update_attributes(params[:student])
    flash[:notice] = "Student updated successfully"
  	redirect_to @student
  else
   	render :action => :edit
  end
end

def destroy
    Student.find(params[:id]).destroy
    flash[:notice] = "Student deleted."
    redirect_to '/students'
  end
end
