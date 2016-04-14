class Message < ActiveRecord::Base
  belongs_to :user
  has_many :receipts
  attr_accessible :contents, :user



  # Sends message to all recipients
  def distribute()
    account_sid = 'ACf91b9f14d8e436a70de5dc8c37a82baf'
    auth_token = 'f2a3429001ecef51f36940d514eec0dd'
    client = Twilio::REST::Client.new account_sid, auth_token
    receipts = Receipt.find_all_by_message_id(self)
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
