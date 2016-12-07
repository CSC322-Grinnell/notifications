class Message < ActiveRecord::Base
  belongs_to :user
  has_many :receipts
  attr_accessible :contents, :user



  # Sends message to all recipients
  def distribute()
    account_sid = 'TWILIO_SID'
    auth_token = 'TWILIO_AUTH_TOKEN'
    client = Twilio::REST::Client.new account_sid, auth_token
    receipts = Receipt.find_all_by_message_id(self)
    #could we sort receipts here so there is only one for each contact then only distribute those???
    #Then in receipt.distribute, we just distribute everything we get so it isnt a mess there
    #Could we change receipt to have a contact attribute instead of student? Then this would be simple
    receipts.each do |receipt|
      receipt.distribute(client)
    end
  end

  # Fetches message with given ID, or all messages if no parameters given.
  def self.fetch(id=nil)
    if id == nil
      return Message.all
    else
      return Message.find_by_id(id)
    end
  end
end
