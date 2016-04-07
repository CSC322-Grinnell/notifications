class Receipt < ActiveRecord::Base
  attr_accessible :message, :student
  # TODO: Add message status enumerated type
  #  Unsent/Queued/Sent/Delivered/Errored
  belongs_to :message
  belongs_to :student

  # Send message to student
  def distribute()
    # TODO: Check status and only send if not already sent
    account_sid = 'ACc3ff9be899397461c075ffcf9e70f35a'
    auth_token = '48f209948887f585f820760a89915194'
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.account.messages.create(body: message.contents,
                                    to: student.Phone_Number,
                                    from: '+16412434422')
  end
end
