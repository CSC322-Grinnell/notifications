class Receipt < ActiveRecord::Base
  require 'rubygems'
  require 'twilio-ruby'

  attr_accessible :message, :contact
  # TODO: Add message status enumerated type
  #  Unsent/Queued/Sent/Delivered/Errored
  belongs_to :message
  belongs_to :contact

  # Send message to student
  def distribute(client)
    client.account.messages.create(
      :from => '+16412438808',
      :to => contact.Phone_Number,
      :body => message.contents)
  end
end
