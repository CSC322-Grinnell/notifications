class Receipt < ActiveRecord::Base
  require 'rubygems'
  require 'twilio-ruby'

  attr_accessible :message, :student
  # TODO: Add message status enumerated type
  #  Unsent/Queued/Sent/Delivered/Errored
  belongs_to :message
  belongs_to :student

  # Send message to student
  def distribute(client)
    # TODO: Check status and only send if not already sent
    student.contact_ids.each do |contact_id|
      # check to make sure contact has not already been sent this message
      @alreadyReceived = FALSE
      Receipt.find_all_by_message_id(message.id).each do |receipt| #look at all receipts for this message
        receipt.student.contacts.each do |contact| #look at each contact that has received this message
          if receipt.student.id != student.id && contact.id == contact_id #account for the fact that Receipts includes the current receipt as well as past receipts
            @alreadyReceived = TRUE
          end
        end
      end
      puts @alreadyReceived
      if !@alreadyReceived
        contact_number = Contact.find_by_id(contact_id).Phone_Number
        puts contact_number
        client.account.messages.create(
          :from => '+16412438808',
          :to => contact_number,
          :body => message.contents)
      end
    end
  end
end
