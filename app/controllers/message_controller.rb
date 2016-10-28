class MessageController < ApplicationController
    def txtmsg
        @sender = params[:From]
        @incomingmsg = params[:Body]
        puts params
        render formats: :xml
        @Users = User.all
        #phone_number not yet created in user table
        @Users.each do |user|
            #from has +1 at beginning, may need to change comparison
            if "+1" + user.phone_number == @sender
                outgoing_message = Message.create(contents: @incomingmsg, user: user)
                #add receipt
                #does this work for finding all student ids???
                #student_ids = params[:student].values
                #student_ids.each do |id|
                student = Student.find_by_id(13)
                Receipt.create(message: outgoing_message, student: student)
                outgoing_message.distribute()
            end
        end
    end
end
