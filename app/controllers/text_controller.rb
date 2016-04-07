# Controls the flow of text messages to members of the Head Start Schools
class TextController < ApplicationController
  before_filter :require_user

  def index
    @classrooms = @current_user.getClassrooms
  end

  def create
    text = params[:message]
    student_ids = params[:student].values

    message = Message.create(contents: text, user: @current_user)

    student_ids.each do |id|
      student = Student.find_by_id(id)
      Receipt.create(message: message, student: student)
    end
    message.distribute()
    redirect_to '/history'
  end
end
