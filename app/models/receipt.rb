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
      contact_number = Contact.find_by_id(contact_id).Phone_Number
      puts contact_number
      client.account.messages.create(
        #:from => '+15005550006',
        :from => '+16412438808',
        :to => contact_number,
        :body => message.contents)
    end
  end
end
