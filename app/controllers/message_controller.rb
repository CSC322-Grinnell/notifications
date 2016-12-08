class MessageController < ApplicationController
    def txtmsg
        puts params
        @AccountID = params[:AccountSid]
        @sender = params[:From]
        @incomingmsg = params[:Body]
        @call = params[:CallSid]
        validUser = false
        validCall = false
        @Users = User.all
        puts params
        if @call != nil
            validCall = true
        elsif ENV_CONFIG['TWILIO_SID'] == @AccountID
            @Users.each do |user|
                if "+1" + user.phone_number == @sender #checks if valid user
                    validUser = true
                    outgoing_message = Message.create(contents: @incomingmsg, user: user)
                    user.classroom_ids.each do |classroom_id|
                        Classroom.find_by_id(classroom_id).student_ids.each do |student_id|
                            student = Student.find_by_id(student_id)
                            student.contacts.each do |contact|
                                @existing_receipts = Receipt.find_all_by_message_id(outgoing_message.id) #creates receipt for contacts
                                if @existing_receipts.length == 0
                                    Receipt.create(message: outgoing_message, contact: contact) #only creates one receipt per contact
                                else
                                    @AlreadyExists = false
                                    @existing_receipts.each do |old_receipt|
                                        if old_receipt.contact == contact 
                                            @AlreadyExists = true
                                        end
                                    end
                                    if @AlreadyExists == false
                                        Receipt.create(message: outgoing_message, contact: contact)
                                    end
                                end
                            end
                        end
                    end
                    outgoing_message.distribute()
                end
            end
        end # if ...
        if validCall
            render :file => "message/call.xml.erb", formats: :xml
        elsif (validUser) #responds to the incoming number based on if they are a valid user or not
            render formats: :xml
        else
            render :file => "message/altmsg.xml.erb", formats: :xml
        end
    end # textmsg
end
