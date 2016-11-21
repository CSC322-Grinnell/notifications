class MessageController < ApplicationController
    def txtmsg
        @AccountID = params[:AccountSid]
        @sender = params[:From]
        @incomingmsg = params[:Body]
        puts params
        render formats: :xml
        @Users = User.all
        if ENV_CONFIG['TWILIO_SID'] == @AccountID
            @Users.each do |user|
                if "+1" + user.phone_number == @sender 
                    outgoing_message = Message.create(contents: @incomingmsg, user: user)
                    user.classroom_ids.each do |classroom_id|
                        Classroom.find_by_id(classroom_id).student_ids.each do |student_id|
                            student = Student.find_by_id(student_id)
                            Receipt.create(message: outgoing_message, student: student)
                            outgoing_message.distribute()
                        end
                    end
                end
            end
        end
    end
end
