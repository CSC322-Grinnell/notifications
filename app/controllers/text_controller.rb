# Controls the flow of text messages to members of the Head Start Schools
class TextController < ApplicationController
  before_filter :require_user

  def index
    @classrooms = @current_user.getClassrooms
  end

  def create
    #puts params
    text = params[:message]
    student_ids = params[:student].values
    #puts student_ids
    message = Message.create(contents: text, user: @current_user)

    student_ids.each do |id|
      student = Student.find_by_id(id)
      student.contacts.each do |contact|
        @existing_receipts = Receipt.find_all_by_message_id(message.id)
        if @existing_receipts.length == 0
          Receipt.create(message: message, contact: contact)
        else
          @AlreadyExists = false
          @existing_receipts.each do |old_receipt|
            if old_receipt.contact == contact 
                @AlreadyExists = true
            end
          end
          if @AlreadyExists == false
              Receipt.create(message: message, contact: contact)
          end
        end
    end
      
      
      
      
    end
    message.distribute()
    redirect_to '/history'
  end
end
