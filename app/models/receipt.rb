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
    client.account.messages.create(
<<<<<<< HEAD
      #testnum=+15005550006
      #realnum=+12406410583
=======
>>>>>>> 30e39204d34d3dc9363188801ef5ed777c733b12
      :from => '+15005550006',
      :to => student.Phone_Number,
      :body => message.contents
    )
  end
end
