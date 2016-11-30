class MessageController < ApplicationController
    def txtmsg
        puts params
        @AccountID = params[:AccountSid]
        @sender = params[:From]
        @incomingmsg = params[:Body]
        render formats: :xml
        @Users = User.all
        if ENV_CONFIG['TWILIO_SID'] == @AccountID
            @Users.each do |user|
                if "+1" + user.phone_number == @sender 
                    outgoing_message = Message.create(contents: @incomingmsg, user: user)
                    user.classroom_ids.each do |classroom_id|
                        Classroom.find_by_id(classroom_id).student_ids.each do |student_id|
                            student = Student.find_by_id(student_id)
                            student.contacts.each do |contact|
                                @existing_receipts = Receipt.find_all_by_message_id(outgoing_message.id)
                                puts @existing_receipts.length
                                if @existing_receipts.length == 0
                                    Receipt.create(message: outgoing_message, contact: contact)
                                    puts contact.Name
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
        end
    end
end
